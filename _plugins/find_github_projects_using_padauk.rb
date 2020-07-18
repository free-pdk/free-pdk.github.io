require 'octokit'
require 'jekyll'

# Stable sort functions by user tokland
# https://stackoverflow.com/a/15442966/2560557
module Enumerable
  def stable_sort
    sort_by.with_index { |x, idx| [x, idx] }
  end

  def stable_sort_by
    sort_by.with_index { |x, idx| [yield(x), idx] }
  end
end

module GitHubPadaukTopics
  class Generator < Jekyll::Generator
    safe true

    # Exclude projects that use the padauk tag but are not actually about Padauk microcontrollers
    excluded_projects = [
      'kaiz16/zg-xkb',
    ]

    QUERY = 'topic:padauk archived:false sort:updated ' + excluded_projects.map { |name| "-repo:#{name}" }.join(" ")

    def cache
      @@cache ||= Jekyll::Cache.new("GitHubPadaukTopics")
    end

    # Stringify all keys of a hash recursively
    # This is needed since hashes passed to Jekyll are not processed correctly if they have symbol keys
    def stringify_keys(h)
      if h.is_a?(Hash) then
        h = h.collect{|k,v| [k.to_s, stringify_keys(v)]}.to_h
      elsif h.is_a?(Array) then
        h = h.collect{|v| stringify_keys(v)}
      end
      h
    end

    def log_rate_limit(client)
      rate_limit = client.rate_limit()
      Jekyll.logger.info "GitHub API rate limit info: #{rate_limit.remaining}/#{rate_limit.limit} remaining, resets in #{rate_limit.resets_in} seconds."
    end

    def generate(site)
      projects, org_events = cache.getset("repos") do
        access_token = ENV['GITHUB_TOKEN']
        client = Octokit::Client.new()
        client.access_token=access_token

        # https://docs.github.com/en/rest/reference/search#search-repositories
        Jekyll.logger.info "Fetching GitHub repositories with topic 'padauk'"
        result = client.search_repositories(QUERY, {
            per_page: 100, sort: 'updated',
            # Set preview header to also get a list of topics for each repository
            accept: ::Octokit::Preview::PREVIEW_TYPES[:topics]
        })
        log_rate_limit(client)
        repos = stringify_keys(result.items.map(&:to_hash))

        projects = Parallel.map(repos, in_threads: 10) do |repo|
          type = "unknown"
          # Only fetch repository files if we have an access token, because we run into rate limits otherwise.
          if access_token then
            if repo["topics"].include?('free-pdk') or repo["topics"].include?('sdcc') or repo["description"].match(/free.?pdk/i) or repo["description"].match(/sdcc/i) then
              type = "free-pdk"
            else
              Jekyll.logger.info "Listing files of #{repo["full_name"]}"
              result = client.tree(repo["full_name"], repo["default_branch"], :recursive => true)
              log_rate_limit(client)

              has_pre = result.tree.detect {|entry| entry.type == "blob" and entry.path.end_with?(".PRE") }
              if has_pre then
                type = "proprietary"
              else
                Jekyll.logger.info "Fetching README of #{repo["full_name"]}"
                result = client.readme(repo["full_name"], :ref => repo["default_branch"], :accept => 'application/vnd.github.VERSION.raw')
                log_rate_limit(client)

                if result.match(/free.?pdk/i) or result.match(/sdcc/i)
                  type = "free-pdk"
                end
              end
            end
          else
            Jekyll.logger.warn "Skipping detection of proprietary toolchain because no GITHUB_TOKEN was found."
          end
          { "type" => type, "data" => repo }
        end

        projects = projects.stable_sort_by { |project| project["type"] == "free-pdk" ? 0 : project["type"] == "unknown" ? 1 : 2 }

        # https://docs.github.com/en/rest/reference/activity#list-public-organization-events
        Jekyll.logger.info "Fetching latest events of the free-pdk organization"
        result = client.organization_public_events('free-pdk', {per_page: 100})
        log_rate_limit(client)
        org_events = stringify_keys(result.map(&:to_hash))

        [projects, org_events]
      end

      site.config['projects_using_padauk'] = projects
      site.config['projects_using_padauk_query_url'] = "https://github.com/search?q=" + ERB::Util.url_encode(QUERY)
      site.config['latest_free_pdk_events'] = org_events
    end
  end
end

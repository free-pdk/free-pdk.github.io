require 'octokit'
require 'jekyll'

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
      repos, org_events = cache.getset("repos") do
        client = Octokit::Client.new()

        # https://docs.github.com/en/rest/reference/search#search-repositories
        Jekyll.logger.info "Fetching GitHub repositories with topic 'padauk'"
        result = client.search_repositories(QUERY, { 
            per_page: 100, sort: 'updated', 
            # Set preview header to also get a list of topics for each repository
            accept: ::Octokit::Preview::PREVIEW_TYPES[:topics] 
        })
        log_rate_limit(client)
        repos = stringify_keys(result.items.map(&:to_hash))

        # https://docs.github.com/en/rest/reference/activity#list-public-organization-events
        Jekyll.logger.info "Fetching latest events of the free-pdk organization"
        result = client.organization_public_events('free-pdk', {per_page: 100})
        log_rate_limit(client)
        org_events = stringify_keys(result.map(&:to_hash))

        [repos, org_events]
      end

      site.config['projects_using_padauk'] = repos
      site.config['projects_using_padauk_query_url'] = "https://github.com/search?q=" + ERB::Util.url_encode(QUERY)
      site.config['latest_free_pdk_events'] = org_events
    end
  end
end

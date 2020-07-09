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

    def generate(site)
      repos = cache.getset("repos") do
        client = Octokit::Client.new()
        Jekyll.logger.info "Fetching GitHub repositories with topic 'padauk'"

        # https://docs.github.com/en/rest/referenceoc/search#search-repositories
        result = client.search_repositories(QUERY, {per_page: 100})
        repos = result.items.map(&:to_hash)
        repos
      end

      site.config['projects_using_padauk'] = stringify_keys(repos)
      site.config['projects_using_padauk_query_url'] = "https://github.com/search?q=" + ERB::Util.url_encode(QUERY)
    end
  end
end

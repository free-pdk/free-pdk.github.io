require 'octokit'
require 'jekyll'

module GitHubPadaukTopics
  class Generator < Jekyll::Generator
    safe true

    QUERY = 'topic:padauk -user:free-pdk archived:false sort:updated'

    def cache
      @@cache ||= Jekyll::Cache.new("GitHubPadaukTopics")
    end

    def generate(site)
      repos = cache.getset("repos") do
        client = Octokit::Client.new()
        Jekyll.logger.info "Fetching GitHub repositories with topic 'padauk'"

        # https://docs.github.com/en/rest/reference/search#search-repositories
        result = client.search_repositories(QUERY, {per_page: 100})
        repos = result.items.map(&:to_hash)
        repos = repos.map { |repo| repo.select {
          |key, value| ["full_name", "html_url", "description", "updated_at", "stargazers_count"].include?(key.to_s) }
        }
        # Convert symbol keys to string keys
        # https://stackoverflow.com/a/36936333/2560557
        repos = repos.map { |repo| repo.collect{|k,v| [k.to_s, v]}.to_h }

        repos
      end

      site.config['projects_using_padauk'] = repos
      site.config['projects_using_padauk_query_url'] = "https://github.com/search?q=" + ERB::Util.url_encode(QUERY)
    end
  end
end
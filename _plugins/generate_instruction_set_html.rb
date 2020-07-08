require 'octokit'
require 'jekyll'
require 'net/http'
require 'uri'
require 'json'

module InstructionSetParser
  class Generator < Jekyll::Generator
    safe true

    def cache
      @@cache ||= Jekyll::Cache.new("InstructionSetParser")
    end

    def download_file_from_docs_repo(filename)
      url = "https://raw.githubusercontent.com/free-pdk/fppa-pdk-documentation/master/#{filename}"
      url = URI.parse(url)
      req = Net::HTTP::Get.new(url.to_s)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == "https")
      res = http.request(req)
      res.body
    end

    def mediawiki_to_html(input)
      uri = URI('https://www.mediawiki.org/w/api.php')
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data({
        'action' => 'parse',
        'text' => input,
        'contentmodel' => 'wikitext',
        'format' => 'json',
        'disablelimitreport' => '1',
        'disableeditsection' => '1',
        'prop' => 'text',
      })

      response = https.request(request)

      JSON.parse(response.body)['parse']['text']['*']
    end

    def generate(site)
      bits = [13, 14, 15, 16]

      instruction_sets = cache.getset("instruction-sets") do
        result = {}
        for bit in bits
          if ENV['CI']
            Jekyll.logger.info "Converting instruction set #{bit}"
            mediawiki = download_file_from_docs_repo("PADAUK_FPPA_#{bit}_bit_instruction_set.wikitext")
            html = mediawiki_to_html(mediawiki)
            result[bit.to_s] = html
          else
            result[bit.to_s] = "<p>This page is only populated when running in CI. Set the \"CI\" environment variable if you want to also populate it locally.</p>"
          end
        end
        result
      end

      site.config['instruction_sets'] = instruction_sets
    end
  end
end
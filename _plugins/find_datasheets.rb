require 'octokit'
require 'jekyll'
require 'nokogiri'
require 'open-uri'
require 'parallel'

module FindPadaukDatasheets
  class Generator < Jekyll::Generator
    safe true
    priority :lowest

    def cache
      @@cache ||= Jekyll::Cache.new("FindPadaukDatasheets")
    end

    def generate(site)
      datasheet_urls = cache.getset("datasheets") do
        chip_pages = site.pages.filter { |page| page.data['layout'] == "chip" and page.data['product_page'] }

        datasheet_urls = Parallel.map(chip_pages, in_threads: 2) do |chip_page|
          url = chip_page['product_page']  
          
          Jekyll.logger.info "Parsing product page for datasheet url: " + url
          doc = Nokogiri::HTML(::OpenURI.open_uri(url, read_timeout: 300))

          pdf_links = doc.css('a[href$=".pdf"]')
          pdf_link = pdf_links.detect { |link| link['href'].include? 'datasheet' and link['href'].include? 'EN' }

          datasheet_url = nil
          if pdf_link
            datasheet_url = (Addressable::URI.parse(url) + pdf_link['href']).to_s
            Jekyll.logger.info "Found datasheet url: " + datasheet_url
          else
            Jekyll.logger.warn "Did not find datasheet url in product page: " + url
          end

          [chip_page.data['title'], datasheet_url]
        end

        datasheet_urls.to_h
      end

      site.config['datasheet_urls'] = datasheet_urls
    end
  end
end

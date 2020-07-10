# Extend markdown converter to add a :link: symbol that acts as access to the header's permalink.
# Based on https://stackoverflow.com/a/53893197/2560557 by Martin Tournoij
class PermalinkedMarkdown < Jekyll::Converters::Markdown
  def convert(content)
      super.gsub(/<h([123]) id="(.*?)">/, '<h\1 id="\2"><a href="#\2">:link:</a> ')
  end
end
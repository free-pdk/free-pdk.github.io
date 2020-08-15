module Linker
  def link_instruction_set(input)
    "<a href=\"/instruction-sets/PDK#{input}\">PDK#{input}</a>"
  end

  def link_chip(input)
    page = @context.registers[:site].pages.detect { |page| page.data['layout'] == 'chip' and page.data['title'] == input }
    if page
      "<a href=\"#{page.url}\">#{input}</a>"
    else
      input
    end
  end
end

Liquid::Template.register_filter(Linker)
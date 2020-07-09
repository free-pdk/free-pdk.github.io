module LinkInstructionSet
  def link_instruction_set(input)
    "<a href=\"/instruction-sets/PDK#{input}\">PDK#{input}</a>"
  end
end

Liquid::Template.register_filter(LinkInstructionSet)
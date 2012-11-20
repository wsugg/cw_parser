#!usr/bin/env ruby
require '../lib/cw_parse_text.rb'
require '../lib/cw_parse_code.rb'


#args to cw_parser: text | code, file, filepath, play code sounds (implement sound later) 

class CW_Parser
 include CW_Parse_Text
 include CW_Parse_Code 

 attr_reader :morse_code

 def initialize(code_or_text=[""],filepath="",sound="no")
	
	@morse_code = {}

	f = File.open("../bin/morsecode.txt", "r")
	#f.each{|i| puts i.ascii_only?}
	f.each{|l| l.split(/\=/); @morse_code.store(l[0],l[2..10].chomp)} 


	if filepath != nil
    	puts filepath

	elsif code_or_text == :text
		puts :text
		code_or_text = "this is the text to translate!"
		parse_text(code_or_text)
		
	elsif code_or_text == :code
		puts :code
		code = "this"
		parse_code(code)
	end	
 end
end
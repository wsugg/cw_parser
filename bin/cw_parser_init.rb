#!usr/bin/env ruby
require '../lib/cw_parse_text.rb'


#args to cw_parser: text | code, file, filepath, play code sounds (implement sound later) 

class CW_Parser
 include CW_Parse_Text 

 attr_reader :morse_code

 def initialize(code_or_text=[""],filepath="",sound="no")
	
	@morse_code = {}

	f = File.open("../bin/morsecode.txt", "r")
	#f.each{|i| puts i.ascii_only?}
	f.each{|l| l.split(/\=/); @morse_code.store(l[0],l[2..10].chomp)} 


	if filepath != nil
    	puts filepath

    	#text_to_morse(@morse_code, :file, ARGV[2])

        #code_to_text(@morse_code, :file, ARGV[2])

	elsif :text == "text"
		puts :text
		code_or_text = "this is the text to translate!"
		parse_text(code_or_text)
		#text_to_morse(@morse_code, :text, ARGV[1])
	elsif :code == "code"
		puts :code
		#code_to_text(@morse_code, :code, ARGV[1])
	end	
 end
end
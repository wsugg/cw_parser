#!usr/bin/env ruby

require_relative "../lib/cw_parse_text.rb"
require_relative "../lib/cw_parse_code.rb"



#args to cw_parser: text | code, file, filepath, play code sounds (implement sound later) 

class CW_Parser

 include CW_Parse_Text
 include CW_Parse_Code 

 attr_reader :morse_code
 attr_accessor :mode, :sound, :filepath 

 def initialize(mode=[:text],filepath="",sound="no")
	@mode = mode
	@filepath = filepath
	@sound = sound

	@morse_code = { 
      "A" => '.-', "B" => '-...', "C" => '-.-.', "D" => '-..', "E" => '.', "F" => '..-.', "G" => '--.',
      "H" => '....', "I" => '..', "J" => '.---', "K" => '-.-', "L" => '.-..', "M" => '--',
      "N" => '-.', "O" => '---', "P" => '.--.', "Q" => '--.-', "R" => '.-.', "S" => '...',
      "T" => '-', "U" => '..-', "V" => '...-', "W" => '.--', "X" => '-..-', "Y" => '-.--',
      "Z" => '--..', "1" => '.----', "2" => '..---', "3" => '...--', "4" => '....-', "5" => '.....',
      "6" => '-....', "7" => '--...', "8" => '---..', "9" => '----.', "0" => '-----', " " => ' ', "" =>'', 
    }

 end

 def translate_file(path="")
  if true == File.exist?(path)
  puts "path: #{path}" 
  puts "mode= #{@mode}"
  ftranslate = File.read(path)
  ftranslate.gsub!(/\n/, " ")
  else 
  puts "#{path} does not exsist"
  end

  if @mode == :text	
  puts ftranslate.inspect
  parse_text(ftranslate)
  else 
  puts ftranslate.inspect
  parse_code(ftranslate)
  end
 end

end



#puts ftranslate
#ftranslate.each{|line| puts "text line:" ;line = line.chop; parse_text(line)}
=begin
if true == File.exist?(filepath)
       puts filepath 
       puts "text_symbol:#{:text} code_or_text:#{code_or_text}"
        if code_or_text == [:text]
        	 ftranslate = File.open(filepath, "r")
        	 ftranslate.each{|line| line = line.chop; parse_text(line)}
        else ftranslate.each{|line| parse_code(line)}
        end

	elsif code_or_text == [:text]
		puts :text
		#code_or_text = "this is the text to translate!"
		#parse_text(code_or_text)
		
	elsif code_or_text == [:code]
		puts :code
		#code = "this"
		parse_code(code)
	end	
=end
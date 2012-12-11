#!usr/bin/env ruby

module CW_Parse_Text 

 def parse_text(text_to_translate)
  text_to_translate_ary = Array.new
  result_str = ""
  
  text_to_translate_ary = text_to_translate.upcase.chars.to_a
  #puts "Text:#{text_to_translate_ary}" #for debugging
  text_to_translate_ary.each{|a| result_str << " " << @morse_code.fetch(a)} #puts result_str} 
  puts "Text:#{text_to_translate_ary}  Morse Code:#{result_str}"
  result_str
 end 
end
#!usr/bin/env ruby

module CW_Parse_Code

 def parse_code(code_to_translate)
  puts "code_to_translate: #{code_to_translate}"
  code_to_translate_ary = Array.new
  result_str = ""

  code_to_translate_ary = code_to_translate.split(' ')
  puts "code to translate array: #{code_to_translate_ary}"
  code_to_translate_ary.each{|a| result_str << @morse_code.key(a)}  
  puts "Code:#{code_to_translate_ary}  Morse Code:#{result_str}"
  result_str

 end
end
 require '~/Fall2012FinalProj/cw_parser/bin/cw_parser_init.rb'
#require "#{File.dirname(__FILE__)}../cw_parser_init.rb"

describe CW_Parser do 
	
	before do
		@cwp = CW_Parser.new()
	end

	it "should create morse code hash" do
		@cwp.morse_code.should be_true 
	end 

	it "should take code, text as the first arg" do
		@cwp1 = CW_Parser.new(:text) #:code
		@cwp1.object_id.should be_true
	end

	it "should take a filepath arg to open a file to translate from text" do

		@cwpf = CW_Parser.new(:text, "./test.txt")
		@cwpf.object_id.should be_true
	end
		it "should take a filepath arg to open a file to translate from code" do

		@cwpf1 = CW_Parser.new(:code, "./test.txt")
		@cwpf1.object_id.should be_true
	end

	it "should have a alphabet and morsecode hash" do
		@cwp.morse_code["A"].should eq ".-"
	end

	it "it should parse text into morse code" do
		text = "this"
		@cwp.parse_text(text).should eq " - .... .. ..."
	end

	it "should parse morse code into text" do
		text = "- .... .. ..."
		pending 
	end
end
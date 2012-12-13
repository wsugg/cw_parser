require '../lib/cw_parser.rb'


describe CW_Parser do 
	testfile = "../lib/test.txt"
	test_code_file = "../lib/test_code.txt"

	before do	
		@cwp = CW_Parser.new(:text, testfile, "no") #:code
	end

	it "should create morse code hash" do
		@cwp.morse_code.should be_true 
	end 

	it "should take code, text as the first arg" do
	    @cwp.mode.should eq :text
	end

	it "should take a filepath arg to open a file to translate from text" do
		@cwp.filepath.should eq testfile 
	end

	it "should have a alphabet and morsecode hash" do
		@cwp.morse_code["A"].should eq ".-"
	end

	it "it should parse text into morse code" do
		text = "this is"
		@cwp.parse_text(text).should eq " - .... .. ...   .. ..."
	end

	it "should parse morse code into text" do
		code = "- .... .. ... .. ..."
		@cwp.parse_code(code).should eq "THISIS"
	end

	it "should open a file and translate the text" do
		@cwp.mode = :text
		result = ""
		result = @cwp.translate_file(testfile)
		result.should eq " - .... .. ...   .. ...   - .... .   - . -..- -   - ---   - .-. .- -. ... .-.. .- - .   .. -.   - .... .   - -..- -   ..-. .. .-.. .   - .... .. ...   .. ...   - .... .   ... . -.-. --- -. -..   .-.. .. -. .   - ---   - .-. .- -. ... .-.. .- - .  "
	end

		it "should open a file and translate the text" do
		@cwp.mode = :code
		result = ""
		result = @cwp.translate_file(test_code_file)
		result.should eq "THISISTHETEXTTOTRANSLATEINTHETXTFILETHISISTHESECONDLINETOTRANSLATE"
	end
end
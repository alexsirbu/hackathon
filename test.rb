require "format_data_converter"

class Test

	def self.json
		FDC.detect_and_to_json "{\"parent\"=>[{\"1\"=>1},{\"2\"=>[{\"l\"=>\"lala\"},{\"t\"=>\"trala\"}]}]}"
	end

	def self.hash
		FDC.detect_and_to_hash "<parent><1>1</1><2><l>\"lala\"</l><t>\"trala\"</t></2></parent>"
	end

	def self.xml
		FDC.detect_and_to_xml "{\"parent\"=>[{\"1\"=>1},{\"2\"=>[{\"l\"=>\"lala\"},{\"t\"=>\"trala\"}]}]}"
	end

	def self.csv
		FDC.detect_and_to_csv "[{\"h1\"=>\"v11\",\"h2\"=>\"v12\",\"h3\"=>\"v13\"},{\"h1\"=>\"v11\",\"h2\"=>\"v12\",\"h3\"=>\"v13\"}]"
	end

	def self.xls
		FDC.detect_and_to_xls '[{"h1"=>"v11","h2"=>"v12","h3"=>"v13"},{"h1"=>"v11","h2"=>"v12","h3"=>"v13"}]'
	end

end


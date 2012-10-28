require "format_data_converter/converter"
require "format_data_converter/detector"
require "format_data_converter/hasher"

class FDC
	
	def self.detect_and_to_json s
		Converter.to_json(Detector.detect	s)
	end

	def self.detect_and_to_hash_symbols s
		Converter.to_hash_symbols(Detector.detect s)
	end

	def self.detect_and_to_hash s
		Converter.to_hash_symbols(Detector.detect s)
	end

end


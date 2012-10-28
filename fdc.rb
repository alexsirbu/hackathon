require "./detect"
require "./from_library"
require "./to_library"

class FDC
	
	def self.detect_and_to_json s
		to_json(detect	s)
	end

	def self.detect_and_to_hash_symbols s
		to_hash_symbols(detect s)
	end

	def self.detect_and_to_hash s
		to_hash_symbols(detect s)
	end

end


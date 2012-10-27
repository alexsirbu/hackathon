class FDC
		
	def self.from_json s
		s.gsub(":","=>")
	end
	
	def self.from_hash s
		s
	end

end

class FDC
		
	def self.from_json s
		s.gsub(":","=>")
	end
	
end

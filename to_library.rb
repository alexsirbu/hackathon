class FDC
	
	def self.to_json s
		s.gsub("=>",":")	
	end

	protected
	
	def self.transform_symbols_to_string s
		is_string=false
		for i in 0..s.length-1 
			if (s[i]=="\"") 
				is_string != is_string
			end
		end
	end

end

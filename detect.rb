class FDC
	def self.detect s
		if detect_json s
			from_json(s)
		else
			"Type not supported or wrong input!"
		end
	end	

	def self.detect_json s
		i=0
		while s[i]=="[" do
			i=i+1
		end
		if s[i] == "{" && (s[i+1] == "\'" || s[i+1] == "\"")
			aux = s.index(s[i+1],i+2)
			aux = aux+1
			while s[aux] == " " do
				 aux=aux+1
			end
			if s[aux] == ":"
				true
			else
				false
			end	
		else
			false
		end
			 
	end
end

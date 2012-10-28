class FDC
	def self.detect s
		if detect_json s
			from_json(s)
		elsif detect_hash s
			from_hash(s)
		elsif detect_activerecord s
			from_activerecord(s)
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
	
	def self.detect_hash s
		i=0
		if s[i] == "{" && (s[i+1] == "\'" || s[i+1] == "\"" || s[i+1] == ":")
			if s[i+1] == "\'" || s[i+1] == "\""			
				aux = s.index(s[i+1],i+2) 
				aux = aux+1
				while s[aux] == " " do
					 aux=aux+1
				end
				if s[aux..aux+1] == "=>"
					true
				else
					false
				end	
			else
				aux = s.index("=>",i+2)
				!aux.nil?
			end
		else
			false
		end	 
	end

	def self.detect_activerecord s
		i=0		
		i=i+1 if s[i]=="["
		if s[i..i+1] == "#<"
			true
		else
			false
		end	
	end
end

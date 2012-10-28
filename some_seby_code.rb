class FDC

	def self.to_xml s
		kont = 1
		n = 0
		name_parent = []
		sxml = ""
			for i in 0..s.length-1
				if (s[i..i+1] == "{\"") 
					sxml << "<"
					saux = s.clone
					n = n+1
					name_parent[n] = saux.slice(i+2..(saux.index('"', i+2)-1))
					if (!name_parent[n].nil?) 
						sxml << name_parent[n] << ">"
					end
				elsif (s[i] == "}")
					sxml << "</" 
					sxml << name_parent[n]
					n = n-1
					sxml << ">"
				elsif (s[i..i+1] == "=>")
					if (s[i+2] == "[")
					elsif saux = s.clone
					sxml << saux.slice(i+2..(saux.index("}", i+2)-1))
					end
				end
			end
		sxml
	end

	def self.from_xml s
		shash = ""
		for i in 0..s.length-2
			if (s[i] == ">") 
				if (s[i+1] == "<")
					if (s[i+2] != "/") 
						saux = s.clone
						if (s[saux.index(">", i+2)+2 .. saux.index(">", i+2)+3] == "</") then shash << '"=>['
						else shash<< ","
						end
					end
				else shash << '"=>'
				saux = s.clone
				shash << '"' << saux.slice(i+1..(saux.index("<", i+2)-1)) << '"'
				end
			elsif (s[i] == "<")
				if (s[i+1] == "/") 
					saux = s.clone
					if (s[saux.index(">", i+1)+1 .. saux.index(">", i+1)+2] == "</") then shash << '}]'
					else shash << '}'
					end
				else shash << '{"'
				saux = s.clone
				shash << saux.slice(i+1..(saux.index(">", i+2)-1))
				end
			end
		end
		shash
	end

	def self.detect_xml s
		if (s[0] == "<") then true
		else
			false
		end	 
	end

end

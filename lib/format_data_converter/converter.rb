class Converter
	
	def self.to_xml s
		s=stringify(eval(s)).to_s
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
					print name_parent
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

	def self.to_json s
		s=stringify(eval(s)).to_s
		s.gsub("=>",":")	
	end

	def self.to_hash_symbols s
		s=symbolize(eval(s)).to_s
	end

	def self.to_hash s
		s=stringify(eval(s)).to_s
	end

	def self.stringify(obj)
    return obj.inject({}){|memo,(k,v)| memo[k.to_s] =  stringify(v); memo} if obj.is_a? Hash
    return obj.inject([]){|memo,v    | memo           << stringify(v); memo} if obj.is_a? Array
    return obj
	end

	def self.symbolize(obj)
		return obj.inject({}){|memo,(k,v)| memo[k.to_sym] =  symbolize(v); memo} if obj.is_a? Hash
    return obj.inject([]){|memo,v    | memo           << symbolize(v); memo} if obj.is_a? Array
    return obj
	end

end

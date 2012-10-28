class Converter
	
	def self.to_yaml s
		"Feature not implemented yet!"
	end	

	def self.to_csv s
		s=stringify(eval(s)).to_s
	  lines=[]
	  items=[]
	  vari1=""
	  vari2=""
	  s=stringify(eval(s)).to_s
	  s=s.gsub("\"",'')
	  s=s.gsub("[",'')
	  s=s.gsub("]",'')
	  s=s.gsub("}",'')
	  s=s.gsub("=>",',')
	  lines=s.split("{")
	  items=lines[1].split(",").map{|word| word+=","}
	  for i in 0..items.length/2-1
	    vari1+=items[i*2]
	    vari2+=items[i*2+1]
	  end
	  vari1=vari1[0..-2]
	  vari2=vari2[0..-2]
	  s=vari1+"\n"+vari2
	  vari1=""
	  for i in 2..lines.length-1
	    items=lines[i].split(",").map{|word| word+=","}
	    for j in 0..items.length/2-1
	    vari1+=items[j*2+1]
	    end
	    vari1=vari1[0..-2]
	    s+="\n"+vari1
	  end
	end	

	def self.to_xls s
		s=stringify(eval(s)).to_s
	  lines=[]
	  columns=[]
	  cols=0
	  rows=0
	  s=s.gsub("\"",'')
	  s=s.gsub("[",'')
	  s=s.gsub("]",'')
	  s=s.gsub("}",'')
	  s=s.gsub("=>",',')
	  lines=s.split("{")
	  rows=lines.length
	  columns=lines[1].split(",")
	  cols=columns.length/2
	  s="<?xml version=\"1.0\"?><Workbook xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"\nxmlns:o=\"urn:schemas-microsoft-com:office:office\"\nxmlns:x=\"urn:schemas-microsoft-com:office:excel\"\nxmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\"\n xmlns:html=\"http://www.w3.org/TR/REC-html40\"><Worksheet ss:Name=\"Sheet 1\"><Table ss:ExpandedColumnCount=\""+cols.to_s+"\" ss:ExpandedRowCount=\""+rows.to_s+"\" x:FullColumns=\"1\" x:FullRows=\"1\"><Row>"
	  for i in 0..columns.length/2-1
	    s+="<Cell><Data ss:Type=\"String\">"+columns[i*2]+"</Data></Cell>"
	  end 
	  s+="</Row><Row>"
	  for i in 0..columns.length/2-1
	    s+="<Cell><Data ss:Type=\"String\">"+columns[i*2+1]+"</Data></Cell>"
	  end
	  s+="</Row>"
	  for i in 2..lines.length-1
	    columns=lines[i].split(",")
	    s+="<Row>"
	    for j in 0..columns.length/2-1
	    s+="<Cell><Data ss:Type=\"String\">"+columns[j*2+1]+"</Data></Cell>"
	    end
	    s+="</Row></Table></Worksheet></Workbook>"
	  end
	  puts s
	end		

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

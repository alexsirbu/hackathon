class FDC
		
	def self.to_csv s
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
	
	def self.detect_csv s
	  str=s
	  lines=str.split("\n")
	  puts "Type not supported or wrong input!" if lines.length < 2
	  counter=lines[0].split(",").length
	  for i in 1..lines.length-1
	    puts "Type not supported or wrong input!" if lines[i].split(",").length != counter
	  end
	end	
end

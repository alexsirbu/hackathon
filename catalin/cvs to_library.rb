class FDC
		
	def self.to_cvs s
	  lines=[]
	  items=[]
	  vari1=""
	  vari2=""
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
	    for i in 0..items.length/2-1
	    vari1+=items[i*2+1]
	    end
	    vari1=vari1[0..-2]
	    s+="\n"+vari1
	  end
	  puts s
	end	
end

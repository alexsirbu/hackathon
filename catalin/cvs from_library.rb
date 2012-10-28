class FDC
		
	def self.from_cvs s
	  lines=[]
	  cols=[]
	  items=[]
	  vari=""
	  s=s.gsub("\"",'')
	  puts s
	  lines=s.split("\n")
	  cols=lines[0].split(",").map{|word| word="\""+word+"\"=>"}
	  for i in 1..lines.length-1
	  items=lines[i].split(",").map{|word| word="\""+word+"\","}
	   var=items[-1]
	   items[-1]=var[0..-2]+"},{"
	   for j in 0..cols.length-1
	     vari+=cols[j]+items[j]
	   end
	  end
	  s="[{"+vari[0..-3]+"]"
	end	
end

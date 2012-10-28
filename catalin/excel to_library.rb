class FDC
		
	def self.to_xls s
	  lines=[]
	  items=[]
	  vari1=""
	  vari2=""
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
	    for i in 0..columns.length/2-1
	    s+="<Cell><Data ss:Type=\"String\">"+columns[i*2+1]+"</Data></Cell>"
	    end
	    s+="</Row></Table></Worksheet></Workbook>"
	  end
	  puts s
	end	
end

class FDC
	
	def self.to_json s
		s=stringify(eval(s)).to_s
		s.gsub("=>",":")	
	end
	
	def self.stringify(obj)
    return obj.inject({}){|memo,(k,v)| memo[k.to_s] =  stringify(v); memo} if obj.is_a? Hash
    return obj.inject([]){|memo,v    | memo           << stringify(v); memo} if obj.is_a? Array
    return obj
	end

end

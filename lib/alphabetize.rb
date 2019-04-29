def alphabetize(array)
	#convert esperanto alphabet to indexed array
	esp_alph = "abcĉdefgĝhĥijĵklmnoprsŝtuŭvz".chars
	
	#track passes through array (strings move up one position each pass as necessary)
	index = 0
	
	while index < array.size
		#track position of string used for comparison in array
		pos_ary = 0
		#track position of character in each string
		pos_str = 0
	
		array.each do |string|
			#establish previous string in array for comparison
			prv_str = array[pos_ary]
			
			#do nothing if string matches previous string
			if string != prv_str
				
				#determine first non-matching character in strings to use for sorting
				while true
					if esp_alph.index(string[pos_str]) == esp_alph.index(prv_str[pos_str])
						pos_str += 1
					else
						break
					end
				end
				
				#sort positions in array for string & previous string
				if esp_alph.index(string[pos_str]) > esp_alph.index(prv_str[pos_str])
					array[pos_ary + 1] = string
				else
					temp = array[pos_ary]
					array[pos_ary] = string
					array[pos_ary + 1] = temp
				end	
				
				#set up next string in array for comparison
				pos_ary += 1
			end	
		end	
		
		index += 1
	end
	
	array
end
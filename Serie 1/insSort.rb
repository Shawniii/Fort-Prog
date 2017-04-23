def inssort!(a)
	for i in 0..a.size−1 do
		j = i
		ins = a [i] 
		while j > 0 && ins < a [j −1] do
			a[j] = a[j −1]
			j = j − 1 
		end 
		a[j] = ins 
	end 
	return a 
end 
namespace math

function nPr (byval n as ulongint, byval r as ulongint) as ulongint
	
	if (n = 0) or (r = 0) then return 0
	
	var result = n
	for i as ulongint = 2 to r
		n -= 1
		result *= n
	next
	return result

end function

end namespace
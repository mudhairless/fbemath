namespace math

function nCr (byval n as ulongint, byval r as ulongint) as ulongint
	
	if (n = 0) or (r = 0) then return 0
	
	var result = n
	for i as ulongint = 2 to r
		n -= 1
		result *= n
	next
	var k = r
	for i as ulongint = r-1 to 1 step -1
		k *= i
	next
	return result / k

end function

end namespace
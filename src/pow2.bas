 #include once "fbemath/pow2.bi"
 
 namespace math

 '' double
 function NextPow2 ( byval ds As double ) As double
    	
	dim as double x = ds
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'This function rounds an T to the next power of 2
	Return x + 1

end function

function RoundPow2 ( byval ds as double ) as double
	dim as double x = ds - 1
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'Rounds to the next power of 2 only if not already a power of 2
	return x + 1
end function

function IsPow2 ( byval n as double ) as boolean
	return not (n and (n - 1))
end function

'' single

function NextPow2 ( byval ds As single ) As single
    	
	dim as single x = ds
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'This function rounds an T to the next power of 2
	Return x + 1

end function

function RoundPow2 ( byval ds as single ) as single
	dim as single x = ds - 1
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'Rounds to the next power of 2 only if not already a power of 2
	return x + 1
end function

function IsPow2 ( byval n as single ) as boolean
	return not (n and (n - 1))
end function

'' integer

function NextPow2 ( byval ds As integer ) As integer
    	
	dim as integer x = ds
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'This function rounds an T to the next power of 2
	Return x + 1

end function

function RoundPow2 ( byval ds as integer ) as integer
	dim as integer x = ds - 1
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'Rounds to the next power of 2 only if not already a power of 2
	return x + 1
end function

function IsPow2 ( byval n as integer ) as boolean
	return not (n and (n - 1))
end function

'' short

function NextPow2 ( byval ds As short ) As short
    	
	dim as short x = ds
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'This function rounds an T to the next power of 2
	Return x + 1

end function

function RoundPow2 ( byval ds as short ) as short
	dim as short x = ds - 1
	dim as uinteger sz = (len( x ) * 8) / 2
	dim as uinteger n = 1

	while n <= sz
		x = x Or (x Shr n)
		n = n ^ 2
	wend
'Rounds to the next power of 2 only if not already a power of 2
	return x + 1
end function

function IsPow2 ( byval n as short ) as boolean
	return not (n and (n - 1))
end function

end namespace
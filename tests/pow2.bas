#include once "fbemath/pow2.bi"

#macro assert_true(lhs)
	if (true = (lhs)) then
        print __FUNCTION__ & " " & #lhs & " = true is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = true is NOT working"
		return
    end if
#endmacro

#macro assert_false(lhs)
	if (false = (lhs)) then
        print __FUNCTION__ & " " & #lhs & " = false is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = false is NOT working"
		return
    end if
#endmacro

private sub ispow2test
	
	dim as ulongint n 
	n = cast(ulongint, 2)
	while n < 2^32
		assert_true( math.ispow2(n) )
		n^=2
	wend

	assert_false( math.ispow2(0) )
	assert_false( math.ispow2(1) )
	assert_false( math.ispow2(33) )
	assert_false( math.ispow2(431) )

end sub
	
ispow2test()
	

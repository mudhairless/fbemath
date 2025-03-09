#include once "fbemath/ncr.bi"
#include once "fbemath/npr.bi"

#macro assert_equal(lhs, rhs)
if ((rhs) = (lhs)) then
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is NOT working"
    end if
#endmacro

using math

sub test_npr

	' 0-size set and/or subset (fail)..
	assert_equal(0, nPr(0, 0))
	assert_equal(0, nPr(1, 0))
	assert_equal(0, nPr(0, 1))
	
	' larger subset (fail)..
	assert_equal(0, nPr(1, 2))
	
	' general..
	assert_equal(311875200, nPr(52, 5))
	
end sub

sub test_ncr

	' 0-size set and/or subset (fail)..
	assert_equal(0, nCr(0, 0))
	assert_equal(0, nCr(1, 0))
	assert_equal(0, nCr(0, 1))
	
	' larger subset (fail)..
	assert_equal(0, nCr(1, 2))
	
	' general..
	assert_equal(2598960, nCr(52, 5))
	
end sub
	
test_npr()
test_ncr()



#include once "fbemath/random.bi"

#macro assert_true(lhs)
	if (true = (lhs)) then
        print __FUNCTION__ & " " & #lhs & " = true is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = true is NOT working"
		return
    end if
#endmacro

using math

sub intRndRangetest

	dim as integer xx

	for n as integer = 1 to 30

		xx = RndRange(1,5)

		assert_true( ( xx >= 1 ) )
		assert_true( ( xx<=5 ) )

	next

end sub

sub doubleRndRangetest

	dim as double xx

	for n as integer = 1 to 30

		xx = RndRange(1.0,5.0)

		assert_true( ( xx > 0.99 ) )
		assert_true( ( xx < 6.0 ) )

	next

end sub

intRndRangetest()
doubleRndRangetest()


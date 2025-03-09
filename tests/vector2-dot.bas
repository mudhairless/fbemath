#include once "fbemath/vector2/vector2d.bi"

#macro assert_true(lhs)
	if (true = (lhs)) then
        print __FUNCTION__ & " " & #lhs & " = true is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = true is NOT working"
		return
    end if
#endmacro

using math

sub Test

    var a = Vector2D( 2.0, 3.0 )
    var b = Vector2D( 4.0, 5.0 )
    
    assert_true( FBE_FLOAT_EQUAL( 23.0, a.Dot(b) ) )

end sub
    
Test()

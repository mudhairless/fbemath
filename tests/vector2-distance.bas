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

var shared origin = Vector2D( 0.0, 0.0 )

private sub Test

    var a = Vector2D( 3.0, 4.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, a.Distance(origin) ) )
    
    var b = Vector2D( 3.0, -4.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, b.Distance(origin) ) )
    
    var c = Vector2D( -3.0, 4.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, c.Distance(origin) ) )
    
    var d = Vector2D( -3.0, -4.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, d.Distance(origin) ) )

end sub

private sub TestZeroX

    var c = Vector2D( 0.0, 3.0 )
    assert_true( FBE_FLOAT_EQUAL( 3.0, c.Distance(origin) ) )
    
    var d = Vector2D( 0.0, -3.0 )
    assert_true( FBE_FLOAT_EQUAL( 3.0, d.Distance(origin) ) )

end sub

private sub TestZeroY

    var a = Vector2D( 4.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 4.0, a.Distance(origin) ) )
    
    var b = Vector2D( -4.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 4.0, b.Distance(origin) ) )

end sub
    
Test()
TestZeroX()
TestZeroY()



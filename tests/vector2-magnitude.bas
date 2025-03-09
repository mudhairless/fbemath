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

private sub Test

    var a = Vector2D( 5.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, a.Magnitude() ) )
    
    var b = Vector2D( -5.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, b.Magnitude() ) )
    
    var c = Vector2D( 0.0, 5.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, c.Magnitude() ) )
    
    var d = Vector2D( 0.0, -5.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, d.Magnitude() ) )

    var e = Vector2D( 3.0, 4.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, e.Magnitude() ) )

end sub
    
	
Test()


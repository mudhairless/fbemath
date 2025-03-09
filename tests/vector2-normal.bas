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

    var a = Vector2D( 10.0, 0.0 )
    a.Normalize()
    assert_true( FBE_FLOAT_EQUAL( 1.0, a.x ) )
    assert_true( FBE_FLOAT_EQUAL( 0.0, a.y ) )
    
    var b = Vector2D( 0.0, 10.0 )
    b.Normalize()
    assert_true( FBE_FLOAT_EQUAL( 0.0, b.x ) )
    assert_true( FBE_FLOAT_EQUAL( 1.0, b.y ) )
    
    var c = Vector2D( -10.0, 0.0 )
    c.Normalize()
    assert_true( FBE_FLOAT_EQUAL( -1.0, c.x ) )
    assert_true( FBE_FLOAT_EQUAL( 0.0, c.y ) )
    
    var d = Vector2D( 0.0, -10.0 )
    d.Normalize()
    assert_true( FBE_FLOAT_EQUAL( 0.0, d.x ) )
    assert_true( FBE_FLOAT_EQUAL( -1.0, d.y ) )

end sub

Test()


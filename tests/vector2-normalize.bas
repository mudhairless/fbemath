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

sub TestSimple

    var a = Vector2D( 100.0, 0.0 )
    a.Normalize()
    
    assert_true( FBE_FLOAT_EQUAL( a.x, 1.0 ) )
    assert_true( FBE_FLOAT_EQUAL( a.y, 0.0 ) )
    
    var b = Vector2D( 0.0, 100.0 )
    b.Normalize()
    
    assert_true( FBE_FLOAT_EQUAL( b.x, 0.0 ) )
    assert_true( FBE_FLOAT_EQUAL( b.y, 1.0 ) )
    
    var c = Vector2D( -100.0, 0.0 )
    c.Normalize()
    
    assert_true( FBE_FLOAT_EQUAL( c.x, -1.0 ) )
    assert_true( FBE_FLOAT_EQUAL( c.y, 0.0 ) )
    
    var d = Vector2D( 0.0, -100.0 )
    d.Normalize()
    
    assert_true( FBE_FLOAT_EQUAL( d.x, 0.0 ) )
    assert_true( FBE_FLOAT_EQUAL( d.y, -1.0 ) )
    
end sub
    
TestSimple()

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

sub Test0

    var a = Vector2D( 100.0, 0.0 )
    
    var theta = a.AngleBetween( a )
    assert_true( FBE_FLOAT_EQUAL( 0.0, FBE_RADIAN_TO_DEGREE( theta ) ) )

end sub

sub Test90

    var a = Vector2D( 100.0, 0.0 )
    var b = Vector2D( 0.0, 100.0 )
    
    var theta = a.AngleBetween( b )
    assert_true( FBE_FLOAT_EQUAL( 90.0, FBE_RADIAN_TO_DEGREE( theta ) ) )
    
    theta = b.AngleBetween( a )
    assert_true( FBE_FLOAT_EQUAL( 90.0, FBE_RADIAN_TO_DEGREE( theta ) ) )

end sub

sub Test180

    var a = Vector2D( -100.0, 0.0 )
    var b = Vector2D( 100.0, 0.0 )
    
    var theta = a.AngleBetween( b )
    assert_true( FBE_FLOAT_EQUAL( 180.0, FBE_RADIAN_TO_DEGREE( theta ) ) )
    
    theta = b.AngleBetween( a )
    assert_true( FBE_FLOAT_EQUAL( 180.0, FBE_RADIAN_TO_DEGREE( theta ) ) )

end sub
    
Test0()
Test90()
Test180()



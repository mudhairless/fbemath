#include once "fbemath/vector3/vector3d.bi"

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

    var a = Vector3D( 5.0, 0.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, a.Magnitude() ) )
    
    var b = Vector3D( -5.0, 0.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, b.Magnitude() ) )
    
    var c = Vector3D( 0.0, 5.0, 0.0  )
    assert_true( FBE_FLOAT_EQUAL( 5.0, c.Magnitude() ) )
    
    var d = Vector3D( 0.0, -5.0, 0.0  )
    assert_true( FBE_FLOAT_EQUAL( 5.0, d.Magnitude() ) )

    var e = Vector3D( 0.0, 0.0, 5.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, e.Magnitude() ) )
    
    var f = Vector3D( 0.0, 0.0, -5.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, f.Magnitude() ) )
    
    var g = Vector3D( 3.0, 4.0, 0.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, g.Magnitude() ) )
    
    var h = Vector3D( 0.0, 3.0, 4.0 )
    assert_true( FBE_FLOAT_EQUAL( 5.0, h.Magnitude() ) )

end sub

Test()
	

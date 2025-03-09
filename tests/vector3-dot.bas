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

    var a = Vector3D( 2.0, 3.0, 4.0 )
    var b = Vector3D( 5.0, 6.0, 7.0 )
    
    assert_TRUE( FBE_FLOAT_EQUAL( 56.0, a.Dot(b) ) )

end sub

Test()
	
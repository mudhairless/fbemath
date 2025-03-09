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

var shared origin = Vector3D( 0.0, 0.0, 0.0 )

# define TEST_DISTANCE_FROM_ORIGIN( v, d ) assert_TRUE( FBE_FLOAT_EQUAL( d, (v).Distance(origin) ) )

private sub Test

    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 3.0, 4.0, 0.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 3.0, -4.0, 0.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( -3.0, 4.0, 0.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( -3.0, -4.0, 0.0 ), 5.0 )
    
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 3.0, 0.0, 4.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 3.0, 0.0, -4.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( -3.0, 0.0, 4.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( -3.0, 0.0, -4.0 ), 5.0 )
    
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 0.0, 3.0, 4.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 0.0, 3.0, -4.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 0.0, -3.0, 4.0 ), 5.0 )
    TEST_DISTANCE_FROM_ORIGIN( Vector3D( 0.0, -3.0, -4.0 ), 5.0 )

end sub
    
Test()


#include once "fbemath/matrix/matrixf.bi"

using math

#macro assert_true(lhs)
if (true = (lhs)) then
        print __FUNCTION__ & " " & #lhs & " = true is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = true is NOT working"
    end if
#endmacro

function check_vector ( byref v as Vector3f, byval x as single, byval y as single, byval z as single) as boolean

    var res = true
    if not (abs((v.x) - (x)) < 0.0000000001f) then
        res = false
    end if
    if not (abs((v.y) - (y)) < 0.0000000001f)  then
        res = false
    end if
    if not (abs((v.z) - (z)) < 0.0000000001f)  then
        res = false
    end if
    return res

end function

sub test_matrix_identity

    var m = matrixf(matrixf.identity())
    m = m

    assert_true( check_vector(m.right,       1.0f, 0.0f, 0.0f) )
    assert_true( check_vector(m.up,          0.0f, 1.0f, 0.0f) )
    assert_true( check_vector(m.forward,     0.0f, 0.0f, 1.0f) )
    assert_true( check_vector(m.position,    0.0f, 0.0f, 0.0f) )

end sub

sub test_matrix_translate

    var m = matrixf(matrixf.identity())
    m.translate( 1.0f, 2.0f, 3.0f )

    assert_true( check_vector(m.right,       1.0f, 0.0f, 0.0f) )
    assert_true( check_vector(m.up,          0.0f, 1.0f, 0.0f) )
    assert_true( check_vector(m.forward,     0.0f, 0.0f, 1.0f) )
    assert_true( check_vector(m.position,    1.0f, 2.0f, 3.0f) )

end sub

sub test_matrix_rotate

    var m = matrixf(matrixf.identity())
    m.rotate( 90.0f, 180.0f, 270.0f )

    assert_true( check_vector(m.right,       -8.571431e-016f,   2.857144e-016f, -1.0f) )
    assert_true( check_vector(m.up,          -1,             -5.714288e-016f,  8.571431e-016f) )
    assert_true( check_vector(m.forward,     -5.714288e-016f,  1.0f,           2.857144e-016f) )
    assert_true( check_vector(m.position,    0.0f,           0.0f,           0.0f) )

end sub

sub test_matrix_invert

    var m = matrixf( _
        type<Vector3F>( 0.0f, 1.0f, 2.0f ), _
        type<Vector3F>( 3.0f, 4.0f, 5.0f ), _
        type<Vector3F>( 6.0f, 7.0f, 8.0f ), _
        type<Vector3F>( 9.0f, 10.0f, 11.0f ) _
    )
    m.invert()

    assert_true( check_vector(m.right,       0f, 3f, 6f) )
    assert_true( check_vector(m.up,          1f, 4f, 7f) )
    assert_true( check_vector(m.forward,     2f, 5f, 8f) )
    assert_true( check_vector(m.position,    -32f, -122f, -212f) )

end sub

sub test_matrix_multiply

    var m = matrixf( _
        type<Vector3F>( 0.0f, 1.0f, 2.0f ), _
        type<Vector3F>( 3.0f, 4.0f, 5.0f ), _
        type<Vector3F>( 6.0f, 7.0f, 8.0f ), _
        type<Vector3F>( 9.0f, 10.0f, 11.0f ) _
    )
    m *= m

    assert_true( check_vector(m.right,       15f, 18f, 21f) )
    assert_true( check_vector(m.up,          42f, 54f, 66f) )
    assert_true( check_vector(m.forward,     69f, 90f, 111f) )
    assert_true( check_vector(m.position,    105f, 136f, 167f) )

end sub

test_matrix_identity()
test_matrix_translate()
test_matrix_rotate()
test_matrix_invert()
test_matrix_multiply()





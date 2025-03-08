#include once "fbemath/vector4/vector4i.bi"

namespace math

constructor Vector4I ( byval x as integer, byval y as integer, byval z as integer, byval w as integer )

    this.x = x
    this.y = y
    this.z = z
    this.w = w

end constructor

constructor Vector4I ( byref v4d as Vector4I )

    this.x = v4d.x
    this.y = v4d.y
    this.z = v4d.z
    this.w = v4d.w

end constructor

constructor Vector4I ( )

    this.x = 0
    this.y = 0
    this.z = 0
    this.w = 0.0

end constructor


function Vector4I.dot ( byref v As Vector4I ) as integer
    Return  this.x * v.x + this.y * v.y + this.z * v.z + this.w * v.w
end function

function Vector4I.magnitude( ) As integer
     Dim Mag As integer = any
     mag = Sqr( this.x ^2 + this.y ^2 + this.z ^2 + this.w ^2 )
     If mag = 0 Then mag = 1
     return mag
end function

sub Vector4I.normalize()
    this = this / this.magnitude()
end sub

function Vector4I.cross( byref v as Vector4I ) as Vector4I
    return Type<Vector4I>((this.y * v.z) - (v.y * this.z), (this.z * v.x) - (v.z * this.x), (this.x * v.y) - (v.x * this.y), this.w)
end function

function Vector4I.distance( byref v as Vector4I ) as integer
    return Sqr((v.x - this.x)^2 + (v.y - this.y)^2 + (v.z - this.z)^2)
end function

operator Vector4I.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & ", w:" & this.w & "}"
end operator

operator Vector4I.cast() as Vector3I
    return type<Vector3I>(this.x, this.y, this.z)
end operator

operator + ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I
    return type<Vector4I>( lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w )
end operator

operator + ( byref lhs as Vector4I, byref rhs as integer ) as Vector4I
    return type<Vector4I>( lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs )
end operator

operator - ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I

    return type<Vector4I>( lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w )

end operator

operator * ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I

    return type<Vector4I>( lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w )

end operator


operator * ( Byref lhs As Vector4I, Byref rhs As integer ) As Vector4I
    Return Type<Vector4I>(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs )
End operator

'operator Vector4I.*= ( byref rhs as matrix )
'    this = this * rhs
'end operator


operator / ( Byref lhs As Vector4I, Byref rhs As integer ) As Vector4I
    Return Type<Vector4I>(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs )
End operator

operator / ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I
    return type<Vector4I>( lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w )
end operator

end namespace
#include once "fbemath/vector4/vector4d.bi"

namespace math

constructor Vector4D ( byval x as double, byval y as double, byval z as double, byval w as double )

    this.x = x
    this.y = y
    this.z = z
    this.w = w

end constructor

constructor Vector4D ( byref v4d as Vector4D )

    this.x = v4d.x
    this.y = v4d.y
    this.z = v4d.z
    this.w = v4d.w

end constructor

constructor Vector4D ( )

    this.x = 0
    this.y = 0
    this.z = 0
    this.w = 0.0

end constructor


function Vector4D.dot ( byref v As Vector4D ) as double
    Return  this.x * v.x + this.y * v.y + this.z * v.z + this.w * v.w
end function

function Vector4D.magnitude( ) As double
     Dim Mag As double = any
     mag = Sqr( this.x ^2 + this.y ^2 + this.z ^2 + this.w ^2 )
     If mag = 0 Then mag = 1
     return mag
end function

sub Vector4D.normalize()
    this = this / this.magnitude()
end sub

function Vector4D.cross( byref v as Vector4D ) as Vector4D
    return Type<Vector4D>((this.y * v.z) - (v.y * this.z), (this.z * v.x) - (v.z * this.x), (this.x * v.y) - (v.x * this.y), this.w)
end function

function Vector4D.distance( byref v as Vector4D ) as double
    return Sqr((v.x - this.x)^2 + (v.y - this.y)^2 + (v.z - this.z)^2)
end function

operator Vector4D.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & ", w:" & this.w & "}"
end operator

operator Vector4D.cast() as Vector3D
    return type<Vector3D>(this.x, this.y, this.z)
end operator

operator + ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D
    return type<Vector4D>( lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w )
end operator

operator + ( byref lhs as Vector4D, byref rhs as double ) as Vector4D
    return type<Vector4D>( lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs )
end operator

operator - ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D

    return type<Vector4D>( lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w )

end operator

operator * ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D

    return type<Vector4D>( lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w )

end operator


operator * ( Byref lhs As Vector4D, Byref rhs As double ) As Vector4D
    Return Type<Vector4D>(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs )
End operator

'operator Vector4D.*= ( byref rhs as matrix )
'    this = this * rhs
'end operator


operator / ( Byref lhs As Vector4D, Byref rhs As double ) As Vector4D
    Return Type<Vector4D>(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs )
End operator

operator / ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D
    return type<Vector4D>( lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w )
end operator

end namespace
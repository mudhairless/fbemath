#include once "fbemath/vector4/vector4s.bi"

namespace math

constructor Vector4S ( byval x as short, byval y as short, byval z as short, byval w as short )

    this.x = x
    this.y = y
    this.z = z
    this.w = w

end constructor

constructor Vector4S ( byref v4d as Vector4S )

    this.x = v4d.x
    this.y = v4d.y
    this.z = v4d.z
    this.w = v4d.w

end constructor

constructor Vector4S ( )

    this.x = 0
    this.y = 0
    this.z = 0
    this.w = 0.0

end constructor


function Vector4S.dot ( byref v As Vector4S ) as short
    Return  this.x * v.x + this.y * v.y + this.z * v.z + this.w * v.w
end function

function Vector4S.magnitude( ) As short
     Dim Mag As short = any
     mag = Sqr( this.x ^2 + this.y ^2 + this.z ^2 + this.w ^2 )
     If mag = 0 Then mag = 1
     return mag
end function

sub Vector4S.normalize()
    this = this / this.magnitude()
end sub

function Vector4S.cross( byref v as Vector4S ) as Vector4S
    return Type<Vector4S>((this.y * v.z) - (v.y * this.z), (this.z * v.x) - (v.z * this.x), (this.x * v.y) - (v.x * this.y), this.w)
end function

function Vector4S.distance( byref v as Vector4S ) as short
    return Sqr((v.x - this.x)^2 + (v.y - this.y)^2 + (v.z - this.z)^2)
end function

operator Vector4S.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & ", w:" & this.w & "}"
end operator

operator Vector4S.cast() as Vector3S
    return type<Vector3S>(this.x, this.y, this.z)
end operator

operator + ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S
    return type<Vector4S>( lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w )
end operator

operator + ( byref lhs as Vector4S, byref rhs as short ) as Vector4S
    return type<Vector4S>( lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs )
end operator

operator - ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S

    return type<Vector4S>( lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w )

end operator

operator * ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S

    return type<Vector4S>( lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w )

end operator


operator * ( Byref lhs As Vector4S, Byref rhs As short ) As Vector4S
    Return Type<Vector4S>(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs )
End operator

'operator Vector4S.*= ( byref rhs as matrix )
'    this = this * rhs
'end operator


operator / ( Byref lhs As Vector4S, Byref rhs As short ) As Vector4S
    Return Type<Vector4S>(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs )
End operator

operator / ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S
    return type<Vector4S>( lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w )
end operator

end namespace
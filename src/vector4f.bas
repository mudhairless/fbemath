#include once "fbemath/vector4/vector4f.bi"

namespace math

constructor Vector4F ( byval x as single, byval y as single, byval z as single, byval w as single )

    this.x = x
    this.y = y
    this.z = z
    this.w = w

end constructor

constructor Vector4F ( byref v4d as Vector4F )

    this.x = v4d.x
    this.y = v4d.y
    this.z = v4d.z
    this.w = v4d.w

end constructor

constructor Vector4F ( )

    this.x = 0
    this.y = 0
    this.z = 0
    this.w = 0.0

end constructor


function Vector4F.dot ( byref v As Vector4F ) as single
    Return  this.x * v.x + this.y * v.y + this.z * v.z + this.w * v.w
end function

function Vector4F.magnitude( ) As single
     Dim Mag As single = any
     mag = Sqr( this.x ^2 + this.y ^2 + this.z ^2 + this.w ^2 )
     If mag = 0 Then mag = 1
     return mag
end function

sub Vector4F.normalize()
    this = this / this.magnitude()
end sub

function Vector4F.cross( byref v as Vector4F ) as Vector4F
    return Type<Vector4F>((this.y * v.z) - (v.y * this.z), (this.z * v.x) - (v.z * this.x), (this.x * v.y) - (v.x * this.y), this.w)
end function

function Vector4F.distance( byref v as Vector4F ) as single
    return Sqr((v.x - this.x)^2 + (v.y - this.y)^2 + (v.z - this.z)^2)
end function

operator Vector4F.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & ", w:" & this.w & "}"
end operator

operator Vector4F.cast() as Vector3F
    return type<Vector3F>(this.x, this.y, this.z)
end operator

operator + ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F
    return type<Vector4F>( lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w )
end operator

operator + ( byref lhs as Vector4F, byref rhs as single ) as Vector4F
    return type<Vector4F>( lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs )
end operator

operator - ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F

    return type<Vector4F>( lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w )

end operator

operator * ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F

    return type<Vector4F>( lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w )

end operator


operator * ( Byref lhs As Vector4F, Byref rhs As single ) As Vector4F
    Return Type<Vector4F>(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs )
End operator

'operator Vector4F.*= ( byref rhs as matrix )
'    this = this * rhs
'end operator


operator / ( Byref lhs As Vector4F, Byref rhs As single ) As Vector4F
    Return Type<Vector4F>(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs )
End operator

operator / ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F
    return type<Vector4F>( lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w )
end operator

end namespace
#include once "fbemath/vector3/vector3s.bi"

namespace math

operator Vector3S.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & "}"
end operator

'' :::::
constructor Vector3S ( _
)
    dim value as short
    this.x = value
    this.y = value
    this.z = value
end constructor

'' :::::
constructor Vector3S ( _
    byval x as short,         _
    byval y as short,         _
    byval z as short          _
)
    this.x = x
    this.y = y
    this.z = z
end constructor

'' :::::
constructor Vector3S ( _
    byref v as const Vector3S _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end constructor

'' :::::
operator Vector3S.let ( _
    byref v as const Vector3S _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end operator

'' :::::
function Vector3S.Magnitude ( _
) as short
    function = sqr( this.x^2 + this.y^2 + this.z^2 )
end function

'' :::::
sub Vector3S.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
        this.z /= m
    end if
end sub

'' :::::
function Vector3S.Normal ( _
) as Vector3S
    dim tmp as Vector3S = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector3S.Dot ( _
    byref v as const Vector3S   _
) as short
    function = this.x * v.x + this.y * v.y + this.z * v.z
end function

'' :::::
function Vector3S.Cross ( _
    byref v as const Vector3S   _
) as Vector3S

    return Vector3S( _
        (this.y * v.z) - (v.y * this.z), _
        (this.z * v.x) - (v.z * this.x), _
        (this.x * v.y) - (v.x * this.y) _
    )
end function

'' :::::
function Vector3S.Distance ( _
    byref v as const Vector3S   _
) as short
    function = math.Distance( this, v )
end function

'' :::::
function Vector3S.AngleBetween ( _
    byref v as const Vector3S   _
) as short
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector3S,  _
    byref b as const Vector3S   _
) as short
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 + (b.z - a.z)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector3S,        _
    byref b as const Vector3S         _
) as short
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
end function

'' :::::
operator - ( _
    byval a as Vector3S     _
) as Vector3S
    return Vector3S( -a.x, -a.y, -a.z )
end operator

'' :::::
operator Vector3S.+= ( _
    byval v as Vector3S         _
)
    this.x += v.x
    this.y += v.y
    this.z += v.z
end operator

'' :::::
operator Vector3S.+= ( _
    byval k as short          _
)
    this.x += k
    this.y += k
    this.z += k
end operator

'' :::::
operator Vector3S.-= ( _
    byval v as Vector3S         _
)
    this.x -= v.x
    this.y -= v.y
    this.z -= v.z
end operator

'' :::::
operator Vector3S.-= ( _
    byval k as short          _
)
    this.x -= k
    this.y -= k
    this.z -= k
end operator

'' :::::
operator Vector3S.*= ( _
    byval v as Vector3S         _
)
    this.x *= v.x
    this.y *= v.y
    this.z *= v.z
end operator

'' :::::
operator Vector3S.*= ( _
    byval k as short          _
)
    this.x *= k
    this.y *= k
    this.z *= k
end operator

'' :::::
operator Vector3S./= ( _
    byval v as Vector3S         _
)
    this.x /= v.x
    this.y /= v.y
    this.z /= v.z
end operator

'' :::::
operator Vector3S./= ( _
    byval k as short          _
)
    this.x /= k
    this.y /= k
    this.z /= k
end operator

'' :::::
operator + ( _
    byval a as Vector3S,        _
    byval b as Vector3S         _
) as Vector3S
    return Vector3S( a.x + b.x, a.y + b.y, a.z + b.z )
end operator

'' :::::
operator + ( _
    byval a as Vector3S,        _
    byval k as short          _
) as Vector3S
    return Vector3S( a.x + k, a.y + k, a.z + k )
end operator

'' :::::
operator - ( _
    byval a as Vector3S,        _
    byval b as Vector3S         _
) as Vector3S
    return Vector3S( a.x - b.x, a.y - b.y, a.z - b.z )
end operator

'' :::::
operator - ( _
    byval a as Vector3S,        _
    byval k as short          _
) as Vector3S
    return Vector3S( a.x - k, a.y - k, a.z - k )
end operator

'' :::::
operator * ( _
    byval a as Vector3S,        _
    byval b as Vector3S         _
) as Vector3S
    return Vector3S( a.x * b.x, a.y * b.y, a.z * b.z )
end operator

'' :::::
operator * ( _
    byval a as Vector3S,        _
    byval k as short          _
) as Vector3S
    return Vector3S( a.x * k, a.y * k, a.z * k )
end operator

'' :::::
operator / ( _
    byval a as Vector3S,        _
    byval b as Vector3S         _
) as Vector3S
    return Vector3S( a.x / b.x, a.y / b.y, a.z / b.z )
end operator

'' :::::
operator / ( _
    byval a as Vector3S,        _
    byval k as short          _
) as Vector3S
    return Vector3S( a.x / k, a.y / k, a.z / k )
end operator

end namespace
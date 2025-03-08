#include once "fbemath/vector3/vector3f.bi"

namespace math

operator Vector3F.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & "}"
end operator

'' :::::
constructor Vector3F ( _
)
    dim value as single
    this.x = value
    this.y = value
    this.z = value
end constructor

'' :::::
constructor Vector3F ( _
    byval x as single,         _
    byval y as single,         _
    byval z as single          _
)
    this.x = x
    this.y = y
    this.z = z
end constructor

'' :::::
constructor Vector3F ( _
    byref v as const Vector3F _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end constructor

'' :::::
operator Vector3F.let ( _
    byref v as const Vector3F _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end operator

'' :::::
function Vector3F.Magnitude ( _
) as single
    function = sqr( this.x^2 + this.y^2 + this.z^2 )
end function

'' :::::
sub Vector3F.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
        this.z /= m
    end if
end sub

'' :::::
function Vector3F.Normal ( _
) as Vector3F
    dim tmp as Vector3F = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector3F.Dot ( _
    byref v as const Vector3F   _
) as single
    function = this.x * v.x + this.y * v.y + this.z * v.z
end function

'' :::::
function Vector3F.Cross ( _
    byref v as const Vector3F   _
) as Vector3F

    return Vector3F( _
        (this.y * v.z) - (v.y * this.z), _
        (this.z * v.x) - (v.z * this.x), _
        (this.x * v.y) - (v.x * this.y) _
    )
end function

'' :::::
function Vector3F.Distance ( _
    byref v as const Vector3F   _
) as single
    function = math.Distance( this, v )
end function

'' :::::
function Vector3F.AngleBetween ( _
    byref v as const Vector3F   _
) as single
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector3F,  _
    byref b as const Vector3F   _
) as single
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 + (b.z - a.z)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector3F,        _
    byref b as const Vector3F         _
) as single
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
end function

'' :::::
operator - ( _
    byval a as Vector3F     _
) as Vector3F
    return Vector3F( -a.x, -a.y, -a.z )
end operator

'' :::::
operator Vector3F.+= ( _
    byval v as Vector3F         _
)
    this.x += v.x
    this.y += v.y
    this.z += v.z
end operator

'' :::::
operator Vector3F.+= ( _
    byval k as single          _
)
    this.x += k
    this.y += k
    this.z += k
end operator

'' :::::
operator Vector3F.-= ( _
    byval v as Vector3F         _
)
    this.x -= v.x
    this.y -= v.y
    this.z -= v.z
end operator

'' :::::
operator Vector3F.-= ( _
    byval k as single          _
)
    this.x -= k
    this.y -= k
    this.z -= k
end operator

'' :::::
operator Vector3F.*= ( _
    byval v as Vector3F         _
)
    this.x *= v.x
    this.y *= v.y
    this.z *= v.z
end operator

'' :::::
operator Vector3F.*= ( _
    byval k as single          _
)
    this.x *= k
    this.y *= k
    this.z *= k
end operator

'' :::::
operator Vector3F./= ( _
    byval v as Vector3F         _
)
    this.x /= v.x
    this.y /= v.y
    this.z /= v.z
end operator

'' :::::
operator Vector3F./= ( _
    byval k as single          _
)
    this.x /= k
    this.y /= k
    this.z /= k
end operator

'' :::::
operator + ( _
    byval a as Vector3F,        _
    byval b as Vector3F         _
) as Vector3F
    return Vector3F( a.x + b.x, a.y + b.y, a.z + b.z )
end operator

'' :::::
operator + ( _
    byval a as Vector3F,        _
    byval k as single          _
) as Vector3F
    return Vector3F( a.x + k, a.y + k, a.z + k )
end operator

'' :::::
operator - ( _
    byval a as Vector3F,        _
    byval b as Vector3F         _
) as Vector3F
    return Vector3F( a.x - b.x, a.y - b.y, a.z - b.z )
end operator

'' :::::
operator - ( _
    byval a as Vector3F,        _
    byval k as single          _
) as Vector3F
    return Vector3F( a.x - k, a.y - k, a.z - k )
end operator

'' :::::
operator * ( _
    byval a as Vector3F,        _
    byval b as Vector3F         _
) as Vector3F
    return Vector3F( a.x * b.x, a.y * b.y, a.z * b.z )
end operator

'' :::::
operator * ( _
    byval a as Vector3F,        _
    byval k as single          _
) as Vector3F
    return Vector3F( a.x * k, a.y * k, a.z * k )
end operator

'' :::::
operator / ( _
    byval a as Vector3F,        _
    byval b as Vector3F         _
) as Vector3F
    return Vector3F( a.x / b.x, a.y / b.y, a.z / b.z )
end operator

'' :::::
operator / ( _
    byval a as Vector3F,        _
    byval k as single          _
) as Vector3F
    return Vector3F( a.x / k, a.y / k, a.z / k )
end operator

end namespace
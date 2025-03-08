#include once "fbemath/vector3/vector3i.bi"

namespace math

operator Vector3I.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & "}"
end operator

'' :::::
constructor Vector3I ( _
)
    dim value as integer
    this.x = value
    this.y = value
    this.z = value
end constructor

'' :::::
constructor Vector3I ( _
    byval x as integer,         _
    byval y as integer,         _
    byval z as integer          _
)
    this.x = x
    this.y = y
    this.z = z
end constructor

'' :::::
constructor Vector3I ( _
    byref v as const Vector3I _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end constructor

'' :::::
operator Vector3I.let ( _
    byref v as const Vector3I _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end operator

'' :::::
function Vector3I.Magnitude ( _
) as integer
    function = sqr( this.x^2 + this.y^2 + this.z^2 )
end function

'' :::::
sub Vector3I.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
        this.z /= m
    end if
end sub

'' :::::
function Vector3I.Normal ( _
) as Vector3I
    dim tmp as Vector3I = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector3I.Dot ( _
    byref v as const Vector3I   _
) as integer
    function = this.x * v.x + this.y * v.y + this.z * v.z
end function

'' :::::
function Vector3I.Cross ( _
    byref v as const Vector3I   _
) as Vector3I

    return Vector3I( _
        (this.y * v.z) - (v.y * this.z), _
        (this.z * v.x) - (v.z * this.x), _
        (this.x * v.y) - (v.x * this.y) _
    )
end function

'' :::::
function Vector3I.Distance ( _
    byref v as const Vector3I   _
) as integer
    function = math.Distance( this, v )
end function

'' :::::
function Vector3I.AngleBetween ( _
    byref v as const Vector3I   _
) as integer
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector3I,  _
    byref b as const Vector3I   _
) as integer
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 + (b.z - a.z)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector3I,        _
    byref b as const Vector3I         _
) as integer
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
end function

'' :::::
operator - ( _
    byval a as Vector3I     _
) as Vector3I
    return Vector3I( -a.x, -a.y, -a.z )
end operator

'' :::::
operator Vector3I.+= ( _
    byval v as Vector3I         _
)
    this.x += v.x
    this.y += v.y
    this.z += v.z
end operator

'' :::::
operator Vector3I.+= ( _
    byval k as integer          _
)
    this.x += k
    this.y += k
    this.z += k
end operator

'' :::::
operator Vector3I.-= ( _
    byval v as Vector3I         _
)
    this.x -= v.x
    this.y -= v.y
    this.z -= v.z
end operator

'' :::::
operator Vector3I.-= ( _
    byval k as integer          _
)
    this.x -= k
    this.y -= k
    this.z -= k
end operator

'' :::::
operator Vector3I.*= ( _
    byval v as Vector3I         _
)
    this.x *= v.x
    this.y *= v.y
    this.z *= v.z
end operator

'' :::::
operator Vector3I.*= ( _
    byval k as integer          _
)
    this.x *= k
    this.y *= k
    this.z *= k
end operator

'' :::::
operator Vector3I./= ( _
    byval v as Vector3I         _
)
    this.x /= v.x
    this.y /= v.y
    this.z /= v.z
end operator

'' :::::
operator Vector3I./= ( _
    byval k as integer          _
)
    this.x /= k
    this.y /= k
    this.z /= k
end operator

'' :::::
operator + ( _
    byval a as Vector3I,        _
    byval b as Vector3I         _
) as Vector3I
    return Vector3I( a.x + b.x, a.y + b.y, a.z + b.z )
end operator

'' :::::
operator + ( _
    byval a as Vector3I,        _
    byval k as integer          _
) as Vector3I
    return Vector3I( a.x + k, a.y + k, a.z + k )
end operator

'' :::::
operator - ( _
    byval a as Vector3I,        _
    byval b as Vector3I         _
) as Vector3I
    return Vector3I( a.x - b.x, a.y - b.y, a.z - b.z )
end operator

'' :::::
operator - ( _
    byval a as Vector3I,        _
    byval k as integer          _
) as Vector3I
    return Vector3I( a.x - k, a.y - k, a.z - k )
end operator

'' :::::
operator * ( _
    byval a as Vector3I,        _
    byval b as Vector3I         _
) as Vector3I
    return Vector3I( a.x * b.x, a.y * b.y, a.z * b.z )
end operator

'' :::::
operator * ( _
    byval a as Vector3I,        _
    byval k as integer          _
) as Vector3I
    return Vector3I( a.x * k, a.y * k, a.z * k )
end operator

'' :::::
operator / ( _
    byval a as Vector3I,        _
    byval b as Vector3I         _
) as Vector3I
    return Vector3I( a.x / b.x, a.y / b.y, a.z / b.z )
end operator

'' :::::
operator / ( _
    byval a as Vector3I,        _
    byval k as integer          _
) as Vector3I
    return Vector3I( a.x / k, a.y / k, a.z / k )
end operator

end namespace
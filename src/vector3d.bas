#include once "fbemath/vector3/vector3d.bi"

namespace math

operator Vector3D.cast() as string
    return "{x:" & this.x & ", y:" & this.y & ", z:" & this.z & "}"
end operator

'' :::::
constructor Vector3D ( _
)
    dim value as double
    this.x = value
    this.y = value
    this.z = value
end constructor

'' :::::
constructor Vector3D ( _
    byval x as double,         _
    byval y as double,         _
    byval z as double          _
)
    this.x = x
    this.y = y
    this.z = z
end constructor

'' :::::
constructor Vector3D ( _
    byref v as const Vector3D _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end constructor

'' :::::
operator Vector3D.let ( _
    byref v as const Vector3D _
)
    this.x = v.x
    this.y = v.y
    this.z = v.z
end operator

'' :::::
function Vector3D.Magnitude ( _
) as double
    function = sqr( this.x^2 + this.y^2 + this.z^2 )
end function

'' :::::
sub Vector3D.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
        this.z /= m
    end if
end sub

'' :::::
function Vector3D.Normal ( _
) as Vector3D
    dim tmp as Vector3D = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector3D.Dot ( _
    byref v as const Vector3D   _
) as double
    function = this.x * v.x + this.y * v.y + this.z * v.z
end function

'' :::::
function Vector3D.Cross ( _
    byref v as const Vector3D   _
) as Vector3D

    return Vector3D( _
        (this.y * v.z) - (v.y * this.z), _
        (this.z * v.x) - (v.z * this.x), _
        (this.x * v.y) - (v.x * this.y) _
    )
end function

'' :::::
function Vector3D.Distance ( _
    byref v as const Vector3D   _
) as double
    function = math.Distance( this, v )
end function

'' :::::
function Vector3D.AngleBetween ( _
    byref v as const Vector3D   _
) as double
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector3D,  _
    byref b as const Vector3D   _
) as double
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 + (b.z - a.z)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector3D,        _
    byref b as const Vector3D         _
) as double
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
end function

'' :::::
operator - ( _
    byval a as Vector3D     _
) as Vector3D
    return Vector3D( -a.x, -a.y, -a.z )
end operator

'' :::::
operator Vector3D.+= ( _
    byval v as Vector3D         _
)
    this.x += v.x
    this.y += v.y
    this.z += v.z
end operator

'' :::::
operator Vector3D.+= ( _
    byval k as double          _
)
    this.x += k
    this.y += k
    this.z += k
end operator

'' :::::
operator Vector3D.-= ( _
    byval v as Vector3D         _
)
    this.x -= v.x
    this.y -= v.y
    this.z -= v.z
end operator

'' :::::
operator Vector3D.-= ( _
    byval k as double          _
)
    this.x -= k
    this.y -= k
    this.z -= k
end operator

'' :::::
operator Vector3D.*= ( _
    byval v as Vector3D         _
)
    this.x *= v.x
    this.y *= v.y
    this.z *= v.z
end operator

'' :::::
operator Vector3D.*= ( _
    byval k as double          _
)
    this.x *= k
    this.y *= k
    this.z *= k
end operator

'' :::::
operator Vector3D./= ( _
    byval v as Vector3D         _
)
    this.x /= v.x
    this.y /= v.y
    this.z /= v.z
end operator

'' :::::
operator Vector3D./= ( _
    byval k as double          _
)
    this.x /= k
    this.y /= k
    this.z /= k
end operator

'' :::::
operator + ( _
    byval a as Vector3D,        _
    byval b as Vector3D         _
) as Vector3D
    return Vector3D( a.x + b.x, a.y + b.y, a.z + b.z )
end operator

'' :::::
operator + ( _
    byval a as Vector3D,        _
    byval k as double          _
) as Vector3D
    return Vector3D( a.x + k, a.y + k, a.z + k )
end operator

'' :::::
operator - ( _
    byval a as Vector3D,        _
    byval b as Vector3D         _
) as Vector3D
    return Vector3D( a.x - b.x, a.y - b.y, a.z - b.z )
end operator

'' :::::
operator - ( _
    byval a as Vector3D,        _
    byval k as double          _
) as Vector3D
    return Vector3D( a.x - k, a.y - k, a.z - k )
end operator

'' :::::
operator * ( _
    byval a as Vector3D,        _
    byval b as Vector3D         _
) as Vector3D
    return Vector3D( a.x * b.x, a.y * b.y, a.z * b.z )
end operator

'' :::::
operator * ( _
    byval a as Vector3D,        _
    byval k as double          _
) as Vector3D
    return Vector3D( a.x * k, a.y * k, a.z * k )
end operator

'' :::::
operator / ( _
    byval a as Vector3D,        _
    byval b as Vector3D         _
) as Vector3D
    return Vector3D( a.x / b.x, a.y / b.y, a.z / b.z )
end operator

'' :::::
operator / ( _
    byval a as Vector3D,        _
    byval k as double          _
) as Vector3D
    return Vector3D( a.x / k, a.y / k, a.z / k )
end operator

end namespace
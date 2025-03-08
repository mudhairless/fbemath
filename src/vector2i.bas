#include once "fbemath/vector2/vector2i.bi"

namespace math

operator Vector2I.cast() as string
    return "{x:" & this.x & ", y:" & this.y & "}"
end operator

'' :::::
constructor Vector2I ( _
)
    dim value as integer
    this.x = value
    this.y = value
end constructor

'' :::::
constructor Vector2I ( _
    byval x as integer,         _
    byval y as integer          _
)
    this.x = x
    this.y = y
end constructor

'' :::::
constructor Vector2I ( _
    byref v as const Vector2I _
)
    this.x = v.x
    this.y = v.y
end constructor

'' :::::
operator Vector2I.let ( _
    byref v as const Vector2I _
)
    this.x = v.x
    this.y = v.y
end operator

'' :::::
function Vector2I.Magnitude ( _
) as integer
    function = sqr( x^2 + y^2 )
end function

'' :::::
sub Vector2I.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
    end if
end sub

'' :::::
function Vector2I.Normal ( _
) as Vector2I
    dim tmp as Vector2I = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector2I.Dot ( _
    byref v as const Vector2I   _
) as integer
    function = this.x * v.x + this.y * v.y
end function

'' :::::
function Vector2I.Cross ( _
    byref v as const Vector2I   _
) as Vector2I

    var x = v.x - this.x
    var y = v.y - this.y
    var m = sqr( x^2 + y^2 )
    return Vector2I( y / m, -x / m )

end function

'' :::::
function Vector2I.Distance ( _
    byref v as const Vector2I   _
) as integer
    function = math.Distance( this, v )
end function

'' :::::
function Vector2I.AngleBetween ( _
    byref v as const Vector2I   _
) as integer
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector2I,  _
    byref b as const Vector2I   _
) as integer
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector2I,        _
    byref b as const Vector2I         _
) as integer
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
'        function = atan2( b.y, b.x ) - atan2( a.y, a.x )
end function

'' :::::
operator - ( _
    byval a as Vector2I     _
) as Vector2I
    return Vector2I( -a.x, -a.y )
end operator

'' :::::
operator Vector2I.+= ( _
    byval v as Vector2I         _
)
    this.x += v.x
    this.y += v.y
end operator

'' :::::
operator Vector2I.+= ( _
    byval k as integer          _
)
    this.x += k
    this.y += k
end operator

'' :::::
operator Vector2I.-= ( _
    byval v as Vector2I         _
)
    this.x -= v.x
    this.y -= v.y
end operator

'' :::::
operator Vector2I.-= ( _
    byval k as integer          _
)
    this.x -= k
    this.y -= k
end operator

'' :::::
operator Vector2I.*= ( _
    byval v as Vector2I         _
)
    this.x *= v.x
    this.y *= v.y
end operator

'' :::::
operator Vector2I.*= ( _
    byval k as integer          _
)
    this.x *= k
    this.y *= k
end operator

'' :::::
operator Vector2I./= ( _
    byval v as Vector2I         _
)
    this.x /= v.x
    this.y /= v.y
end operator

'' :::::
operator Vector2I./= ( _
    byval k as integer          _
)
    this.x /= k
    this.y /= k
end operator

'' :::::
operator + ( _
    byval a as Vector2I,        _
    byval b as Vector2I         _
) as Vector2I
    return Vector2I( a.x + b.x, a.y + b.y )
end operator

'' :::::
operator + ( _
    byval a as Vector2I,        _
    byval k as integer          _
) as Vector2I
    return Vector2I( a.x + k, a.y + k )
end operator

'' :::::
operator - ( _
    byval a as Vector2I,        _
    byval b as Vector2I         _
) as Vector2I
    return Vector2I( a.x - b.x, a.y - b.y )
end operator

'' :::::
operator - ( _
    byval a as Vector2I,        _
    byval k as integer          _
) as Vector2I
    return Vector2I( a.x - k, a.y - k )
end operator

'' :::::
operator * ( _
    byval a as Vector2I,        _
    byval b as Vector2I         _
) as Vector2I
    return Vector2I( a.x * b.x, a.y * b.y )
end operator

'' :::::
operator * ( _
    byval a as Vector2I,        _
    byval k as integer          _
) as Vector2I
    return Vector2I( a.x * k, a.y * k )
end operator

'' :::::
operator / ( _
    byval a as Vector2I,        _
    byval b as Vector2I         _
) as Vector2I
    return Vector2I( a.x / b.x, a.y / b.y )
end operator

'' :::::
operator / ( _
    byval a as Vector2I,        _
    byval k as integer          _
) as Vector2I
    return Vector2I( a.x / k, a.y / k )
end operator

end namespace
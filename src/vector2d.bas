#include once "fbemath/vector2/vector2d.bi"

namespace math

operator Vector2D.cast() as string
    return "{x:" & this.x & ", y:" & this.y & "}"
end operator

'' :::::
constructor Vector2D ( _
)
    dim value as double
    this.x = value
    this.y = value
end constructor

'' :::::
constructor Vector2D ( _
    byval x as double,         _
    byval y as double          _
)
    this.x = x
    this.y = y
end constructor

'' :::::
constructor Vector2D ( _
    byref v as const Vector2D _
)
    this.x = v.x
    this.y = v.y
end constructor

'' :::::
operator Vector2D.let ( _
    byref v as const Vector2D _
)
    this.x = v.x
    this.y = v.y
end operator

'' :::::
function Vector2D.Magnitude ( _
) as double
    function = sqr( x^2 + y^2 )
end function

'' :::::
sub Vector2D.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
    end if
end sub

'' :::::
function Vector2D.Normal ( _
) as Vector2D
    dim tmp as Vector2D = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector2D.Dot ( _
    byref v as const Vector2D   _
) as double
    function = this.x * v.x + this.y * v.y
end function

'' :::::
function Vector2D.Cross ( _
    byref v as const Vector2D   _
) as Vector2D

    var x = v.x - this.x
    var y = v.y - this.y
    var m = sqr( x^2 + y^2 )
    return Vector2D( y / m, -x / m )

end function

'' :::::
function Vector2D.Distance ( _
    byref v as const Vector2D   _
) as double
    function = math.Distance( this, v )
end function

'' :::::
function Vector2D.AngleBetween ( _
    byref v as const Vector2D   _
) as double
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector2D,  _
    byref b as const Vector2D   _
) as double
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector2D,        _
    byref b as const Vector2D         _
) as double
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
'        function = atan2( b.y, b.x ) - atan2( a.y, a.x )
end function

'' :::::
operator - ( _
    byval a as Vector2D     _
) as Vector2D
    return Vector2D( -a.x, -a.y )
end operator

'' :::::
operator Vector2D.+= ( _
    byval v as Vector2D         _
)
    this.x += v.x
    this.y += v.y
end operator

'' :::::
operator Vector2D.+= ( _
    byval k as double          _
)
    this.x += k
    this.y += k
end operator

'' :::::
operator Vector2D.-= ( _
    byval v as Vector2D         _
)
    this.x -= v.x
    this.y -= v.y
end operator

'' :::::
operator Vector2D.-= ( _
    byval k as double          _
)
    this.x -= k
    this.y -= k
end operator

'' :::::
operator Vector2D.*= ( _
    byval v as Vector2D         _
)
    this.x *= v.x
    this.y *= v.y
end operator

'' :::::
operator Vector2D.*= ( _
    byval k as double          _
)
    this.x *= k
    this.y *= k
end operator

'' :::::
operator Vector2D./= ( _
    byval v as Vector2D         _
)
    this.x /= v.x
    this.y /= v.y
end operator

'' :::::
operator Vector2D./= ( _
    byval k as double          _
)
    this.x /= k
    this.y /= k
end operator

'' :::::
operator + ( _
    byval a as Vector2D,        _
    byval b as Vector2D         _
) as Vector2D
    return Vector2D( a.x + b.x, a.y + b.y )
end operator

'' :::::
operator + ( _
    byval a as Vector2D,        _
    byval k as double          _
) as Vector2D
    return Vector2D( a.x + k, a.y + k )
end operator

'' :::::
operator - ( _
    byval a as Vector2D,        _
    byval b as Vector2D         _
) as Vector2D
    return Vector2D( a.x - b.x, a.y - b.y )
end operator

'' :::::
operator - ( _
    byval a as Vector2D,        _
    byval k as double          _
) as Vector2D
    return Vector2D( a.x - k, a.y - k )
end operator

'' :::::
operator * ( _
    byval a as Vector2D,        _
    byval b as Vector2D         _
) as Vector2D
    return Vector2D( a.x * b.x, a.y * b.y )
end operator

'' :::::
operator * ( _
    byval a as Vector2D,        _
    byval k as double          _
) as Vector2D
    return Vector2D( a.x * k, a.y * k )
end operator

'' :::::
operator / ( _
    byval a as Vector2D,        _
    byval b as Vector2D         _
) as Vector2D
    return Vector2D( a.x / b.x, a.y / b.y )
end operator

'' :::::
operator / ( _
    byval a as Vector2D,        _
    byval k as double          _
) as Vector2D
    return Vector2D( a.x / k, a.y / k )
end operator

end namespace
#include once "fbemath/vector2/vector2s.bi"

namespace math

operator Vector2S.cast() as string
    return "{x:" & this.x & ", y:" & this.y & "}"
end operator

'' :::::
constructor Vector2S ( _
)
    dim value as short
    this.x = value
    this.y = value
end constructor

'' :::::
constructor Vector2S ( _
    byval x as short,         _
    byval y as short          _
)
    this.x = x
    this.y = y
end constructor

'' :::::
constructor Vector2S ( _
    byref v as const Vector2S _
)
    this.x = v.x
    this.y = v.y
end constructor

'' :::::
operator Vector2S.let ( _
    byref v as const Vector2S _
)
    this.x = v.x
    this.y = v.y
end operator

'' :::::
function Vector2S.Magnitude ( _
) as short
    function = sqr( x^2 + y^2 )
end function

'' :::::
sub Vector2S.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
    end if
end sub

'' :::::
function Vector2S.Normal ( _
) as Vector2S
    dim tmp as Vector2S = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector2S.Dot ( _
    byref v as const Vector2S   _
) as short
    function = this.x * v.x + this.y * v.y
end function

'' :::::
function Vector2S.Cross ( _
    byref v as const Vector2S   _
) as Vector2S

    var x = v.x - this.x
    var y = v.y - this.y
    var m = sqr( x^2 + y^2 )
    return Vector2S( y / m, -x / m )

end function

'' :::::
function Vector2S.Distance ( _
    byref v as const Vector2S   _
) as short
    function = math.Distance( this, v )
end function

'' :::::
function Vector2S.AngleBetween ( _
    byref v as const Vector2S   _
) as short
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector2S,  _
    byref b as const Vector2S   _
) as short
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector2S,        _
    byref b as const Vector2S         _
) as short
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
'        function = atan2( b.y, b.x ) - atan2( a.y, a.x )
end function

'' :::::
operator - ( _
    byval a as Vector2S     _
) as Vector2S
    return Vector2S( -a.x, -a.y )
end operator

'' :::::
operator Vector2S.+= ( _
    byval v as Vector2S         _
)
    this.x += v.x
    this.y += v.y
end operator

'' :::::
operator Vector2S.+= ( _
    byval k as short          _
)
    this.x += k
    this.y += k
end operator

'' :::::
operator Vector2S.-= ( _
    byval v as Vector2S         _
)
    this.x -= v.x
    this.y -= v.y
end operator

'' :::::
operator Vector2S.-= ( _
    byval k as short          _
)
    this.x -= k
    this.y -= k
end operator

'' :::::
operator Vector2S.*= ( _
    byval v as Vector2S         _
)
    this.x *= v.x
    this.y *= v.y
end operator

'' :::::
operator Vector2S.*= ( _
    byval k as short          _
)
    this.x *= k
    this.y *= k
end operator

'' :::::
operator Vector2S./= ( _
    byval v as Vector2S         _
)
    this.x /= v.x
    this.y /= v.y
end operator

'' :::::
operator Vector2S./= ( _
    byval k as short          _
)
    this.x /= k
    this.y /= k
end operator

'' :::::
operator + ( _
    byval a as Vector2S,        _
    byval b as Vector2S         _
) as Vector2S
    return Vector2S( a.x + b.x, a.y + b.y )
end operator

'' :::::
operator + ( _
    byval a as Vector2S,        _
    byval k as short          _
) as Vector2S
    return Vector2S( a.x + k, a.y + k )
end operator

'' :::::
operator - ( _
    byval a as Vector2S,        _
    byval b as Vector2S         _
) as Vector2S
    return Vector2S( a.x - b.x, a.y - b.y )
end operator

'' :::::
operator - ( _
    byval a as Vector2S,        _
    byval k as short          _
) as Vector2S
    return Vector2S( a.x - k, a.y - k )
end operator

'' :::::
operator * ( _
    byval a as Vector2S,        _
    byval b as Vector2S         _
) as Vector2S
    return Vector2S( a.x * b.x, a.y * b.y )
end operator

'' :::::
operator * ( _
    byval a as Vector2S,        _
    byval k as short          _
) as Vector2S
    return Vector2S( a.x * k, a.y * k )
end operator

'' :::::
operator / ( _
    byval a as Vector2S,        _
    byval b as Vector2S         _
) as Vector2S
    return Vector2S( a.x / b.x, a.y / b.y )
end operator

'' :::::
operator / ( _
    byval a as Vector2S,        _
    byval k as short          _
) as Vector2S
    return Vector2S( a.x / k, a.y / k )
end operator

end namespace
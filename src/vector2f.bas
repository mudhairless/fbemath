#include once "fbemath/vector2/vector2f.bi"

namespace math

operator Vector2F.cast() as string
    return "{x:" & this.x & ", y:" & this.y & "}"
end operator

'' :::::
constructor Vector2F ( _
)
    dim value as single
    this.x = value
    this.y = value
end constructor

'' :::::
constructor Vector2F ( _
    byval x as single,         _
    byval y as single          _
)
    this.x = x
    this.y = y
end constructor

'' :::::
constructor Vector2F ( _
    byref v as const Vector2F _
)
    this.x = v.x
    this.y = v.y
end constructor

'' :::::
operator Vector2F.let ( _
    byref v as const Vector2F _
)
    this.x = v.x
    this.y = v.y
end operator

'' :::::
function Vector2F.Magnitude ( _
) as single
    function = sqr( x^2 + y^2 )
end function

'' :::::
sub Vector2F.Normalize ( _
)
    var m = this.Magnitude()
    if ( m <> 0 ) then
        this.x /= m
        this.y /= m
    end if
end sub

'' :::::
function Vector2F.Normal ( _
) as Vector2F
    dim tmp as Vector2F = this
    tmp.Normalize()
    return tmp
end function

'' :::::
function Vector2F.Dot ( _
    byref v as const Vector2F   _
) as single
    function = this.x * v.x + this.y * v.y
end function

'' :::::
function Vector2F.Cross ( _
    byref v as const Vector2F   _
) as Vector2F

    var x = v.x - this.x
    var y = v.y - this.y
    var m = sqr( x^2 + y^2 )
    return Vector2F( y / m, -x / m )

end function

'' :::::
function Vector2F.Distance ( _
    byref v as const Vector2F   _
) as single
    function = math.Distance( this, v )
end function

'' :::::
function Vector2F.AngleBetween ( _
    byref v as const Vector2F   _
) as single
    function = math.AngleBetween( this, v )
end function

'' :::::
function Distance ( _
    byref a as const Vector2F,  _
    byref b as const Vector2F   _
) as single
    function = sqr( (b.x - a.x)^2 + (b.y - a.y)^2 )
end function

'' :::::
function AngleBetween ( _
    byref a as const Vector2F,        _
    byref b as const Vector2F         _
) as single
    function = acos( a.dot(b) / (a.Magnitude() * b.Magnitude()) )
'        function = atan2( b.y, b.x ) - atan2( a.y, a.x )
end function

'' :::::
operator - ( _
    byval a as Vector2F     _
) as Vector2F
    return Vector2F( -a.x, -a.y )
end operator

'' :::::
operator Vector2F.+= ( _
    byval v as Vector2F         _
)
    this.x += v.x
    this.y += v.y
end operator

'' :::::
operator Vector2F.+= ( _
    byval k as single          _
)
    this.x += k
    this.y += k
end operator

'' :::::
operator Vector2F.-= ( _
    byval v as Vector2F         _
)
    this.x -= v.x
    this.y -= v.y
end operator

'' :::::
operator Vector2F.-= ( _
    byval k as single          _
)
    this.x -= k
    this.y -= k
end operator

'' :::::
operator Vector2F.*= ( _
    byval v as Vector2F         _
)
    this.x *= v.x
    this.y *= v.y
end operator

'' :::::
operator Vector2F.*= ( _
    byval k as single          _
)
    this.x *= k
    this.y *= k
end operator

'' :::::
operator Vector2F./= ( _
    byval v as Vector2F         _
)
    this.x /= v.x
    this.y /= v.y
end operator

'' :::::
operator Vector2F./= ( _
    byval k as single          _
)
    this.x /= k
    this.y /= k
end operator

'' :::::
operator + ( _
    byval a as Vector2F,        _
    byval b as Vector2F         _
) as Vector2F
    return Vector2F( a.x + b.x, a.y + b.y )
end operator

'' :::::
operator + ( _
    byval a as Vector2F,        _
    byval k as single          _
) as Vector2F
    return Vector2F( a.x + k, a.y + k )
end operator

'' :::::
operator - ( _
    byval a as Vector2F,        _
    byval b as Vector2F         _
) as Vector2F
    return Vector2F( a.x - b.x, a.y - b.y )
end operator

'' :::::
operator - ( _
    byval a as Vector2F,        _
    byval k as single          _
) as Vector2F
    return Vector2F( a.x - k, a.y - k )
end operator

'' :::::
operator * ( _
    byval a as Vector2F,        _
    byval b as Vector2F         _
) as Vector2F
    return Vector2F( a.x * b.x, a.y * b.y )
end operator

'' :::::
operator * ( _
    byval a as Vector2F,        _
    byval k as single          _
) as Vector2F
    return Vector2F( a.x * k, a.y * k )
end operator

'' :::::
operator / ( _
    byval a as Vector2F,        _
    byval b as Vector2F         _
) as Vector2F
    return Vector2F( a.x / b.x, a.y / b.y )
end operator

'' :::::
operator / ( _
    byval a as Vector2F,        _
    byval k as single          _
) as Vector2F
    return Vector2F( a.x / k, a.y / k )
end operator

end namespace
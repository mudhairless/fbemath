#include once "fbemath/common.bi"

namespace math

''Class: Vector2S
''Represents a simple 2 dimensional point of type.
''
type Vector2S

    ''Variable: x
    x as short
    ''Variable: y
    y as short

    '' sub: default constructor
    declare constructor ( _
    )

    '' sub: component constructor
    declare constructor ( _
        byval x as short, _
        byval y as short  _
    )

    '' sub: copy constructor
    declare constructor ( _
        byref v as const Vector2S _
    )

    '' sub: copy operator let
    declare operator let ( _
        byref v as const Vector2S _
    )
    
    '' sub: cast to string operator
    declare operator cast ( ) as string

    '' function: Magnitude
    declare const function Magnitude ( _
    ) as short

    '' sub: Normalize
    declare sub Normalize ( _
    )

    '' function: Normal
    declare const function Normal ( _
    ) as Vector2S

    '' function: Dot
    ''vector dot product function
    ''
    ''Parameters:
    ''v - second vector for dot product operation.
    ''
    ''Returns:
    ''short precision dot product of vector "this"  and vector "v"
    ''
    declare const function Dot ( _
        byref v as const Vector2S _
    ) as short

    '' function: Cross
    ''vector cross product function
    ''
    ''Parameters:
    ''v - second vector for cross product operation
    ''
    ''Returns:
    ''cross product of vector "this" and vector "v"
    ''
    declare const function Cross ( _
        byref v as const Vector2S _
    ) as Vector2S

    declare operator += ( byval v as Vector2S )
    declare operator += ( byval k as short )
    declare operator -= ( byval v as Vector2S )
    declare operator -= ( byval k as short )
    declare operator *= ( byval v as Vector2S )
    declare operator *= ( byval k as short )
    declare operator /= ( byval v as Vector2S )
    declare operator /= ( byval k as short )

    '' function: Distance
    ''  Returns the distance between the endpoints of the vector and
    ''  another.
    declare const function Distance ( byref v as const Vector2S ) as short

    '' function: AngleBetween
    ''  Returns the angle between the vector and another.
    declare const function AngleBetween ( byref v as const Vector2S ) as short

end type

'' function: Distance
''  Returns the distance between the endpoints of two vectors.
declare function Distance overload ( _
    byref a as const Vector2S,    _
    byref b as const Vector2S     _
) as short

'' function: AngleBetween
''  Returns the angle between two vectors.
declare function AngleBetween overload ( _
    byref a as const Vector2S,    _
    byref b as const Vector2S     _
) as short

'' function: global operator - (negate)
''  Returns a * -1.
declare operator - ( _
    byval a as Vector2S     _
) as Vector2S

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of two vectors.
declare operator + ( _
    byval a as Vector2S,    _
    byval b as Vector2S     _
) as Vector2S

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of a vector and a scalar.
declare operator + ( _
    byval a as Vector2S,    _
    byval k as short      _
) as Vector2S

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of two vectors.
declare operator - ( _
    byval a as Vector2S,    _
    byval b as Vector2S     _
) as Vector2S

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of a vector and a scalar.
declare operator - ( _
    byval a as Vector2S,    _
    byval k as short      _
) as Vector2S

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of two vectors.
declare operator * ( _
    byval a as Vector2S,    _
    byval b as Vector2S     _
) as Vector2S

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of a vector and a scalar.
declare operator * ( _
    byval a as Vector2S,    _
    byval k as short      _
) as Vector2S

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of two vectors.
declare operator / ( _
    byval a as Vector2S,    _
    byval b as Vector2S     _
) as Vector2S

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of a vector and a scalar.
declare operator / ( _
    byval a as Vector2S,    _
    byval k as short      _
) as Vector2S

end namespace
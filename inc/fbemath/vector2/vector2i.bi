#include once "fbemath/common.bi"

namespace math

''Class: Vector2I
''Represents a simple 2 dimensional point of type.
''
type Vector2I

    ''Variable: x
    x as integer
    ''Variable: y
    y as integer

    '' sub: default constructor
    declare constructor ( _
    )

    '' sub: component constructor
    declare constructor ( _
        byval x as integer, _
        byval y as integer  _
    )

    '' sub: copy constructor
    declare constructor ( _
        byref v as const Vector2I _
    )

    '' sub: copy operator let
    declare operator let ( _
        byref v as const Vector2I _
    )
    
    '' sub: cast to string operator
    declare operator cast ( ) as string

    '' function: Magnitude
    declare const function Magnitude ( _
    ) as integer

    '' sub: Normalize
    declare sub Normalize ( _
    )

    '' function: Normal
    declare const function Normal ( _
    ) as Vector2I

    '' function: Dot
    ''vector dot product function
    ''
    ''Parameters:
    ''v - second vector for dot product operation.
    ''
    ''Returns:
    ''integer precision dot product of vector "this"  and vector "v"
    ''
    declare const function Dot ( _
        byref v as const Vector2I _
    ) as integer

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
        byref v as const Vector2I _
    ) as Vector2I

    declare operator += ( byval v as Vector2I )
    declare operator += ( byval k as integer )
    declare operator -= ( byval v as Vector2I )
    declare operator -= ( byval k as integer )
    declare operator *= ( byval v as Vector2I )
    declare operator *= ( byval k as integer )
    declare operator /= ( byval v as Vector2I )
    declare operator /= ( byval k as integer )

    '' function: Distance
    ''  Returns the distance between the endpoints of the vector and
    ''  another.
    declare const function Distance ( byref v as const Vector2I ) as integer

    '' function: AngleBetween
    ''  Returns the angle between the vector and another.
    declare const function AngleBetween ( byref v as const Vector2I ) as integer

end type

'' function: Distance
''  Returns the distance between the endpoints of two vectors.
declare function Distance overload ( _
    byref a as const Vector2I,    _
    byref b as const Vector2I     _
) as integer

'' function: AngleBetween
''  Returns the angle between two vectors.
declare function AngleBetween overload ( _
    byref a as const Vector2I,    _
    byref b as const Vector2I     _
) as integer

'' function: global operator - (negate)
''  Returns a * -1.
declare operator - ( _
    byval a as Vector2I     _
) as Vector2I

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of two vectors.
declare operator + ( _
    byval a as Vector2I,    _
    byval b as Vector2I     _
) as Vector2I

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of a vector and a scalar.
declare operator + ( _
    byval a as Vector2I,    _
    byval k as integer      _
) as Vector2I

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of two vectors.
declare operator - ( _
    byval a as Vector2I,    _
    byval b as Vector2I     _
) as Vector2I

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of a vector and a scalar.
declare operator - ( _
    byval a as Vector2I,    _
    byval k as integer      _
) as Vector2I

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of two vectors.
declare operator * ( _
    byval a as Vector2I,    _
    byval b as Vector2I     _
) as Vector2I

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of a vector and a scalar.
declare operator * ( _
    byval a as Vector2I,    _
    byval k as integer      _
) as Vector2I

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of two vectors.
declare operator / ( _
    byval a as Vector2I,    _
    byval b as Vector2I     _
) as Vector2I

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of a vector and a scalar.
declare operator / ( _
    byval a as Vector2I,    _
    byval k as integer      _
) as Vector2I

end namespace
#include once "fbemath/common.bi"

namespace math

''Class: Vector3I
''Represents a 3 dimensional point of type.
type Vector3I
    x as integer
    y as integer
    z as integer
    
    '' sub: default constructor
    declare constructor ( _
    )
    
    '' sub: component constructor
    declare constructor ( _
        byval x as integer, _
        byval y as integer, _
        byval z as integer  _
    )
    
    '' sub: copy constructor
    declare constructor ( _
        byref v as const Vector3I _
    )
    
    '' sub: copy operator let
    declare operator let ( _
        byref v as const Vector3I _
    )
    
    '' sub: operator cast as string
    declare operator cast () as string
    
    '' function: Magnitude
    declare const function Magnitude ( _
    ) as integer
    
    '' sub: Normalize
    declare sub Normalize ( _
    )
    
    '' function: Normal
    declare const function Normal ( _
    ) as Vector3I
    
    '' function: Dot
    declare const function Dot ( _
        byref v as const Vector3I _
    ) as integer
    
    '' function: Cross
    declare const function Cross ( _
        byref v as const Vector3I _
    ) as Vector3I
    
    declare operator += ( byval v as Vector3I )
    declare operator += ( byval k as integer )
    declare operator -= ( byval v as Vector3I )
    declare operator -= ( byval k as integer )
    declare operator *= ( byval v as Vector3I )
    declare operator *= ( byval k as integer )
    declare operator /= ( byval v as Vector3I )
    declare operator /= ( byval k as integer )
    
    '' function: Distance
    ''  Returns the distance between the endpoints of the vector and
    ''  another.
    declare const function Distance ( byref v as const Vector3I ) as integer
    
    '' function: AngleBetween
    ''  Returns the angle between the vector and another.
    declare const function AngleBetween ( byref v as const Vector3I ) as integer

end type

'' function: Distance
''  Returns the distance between the endpoints of two vectors.
declare function Distance overload ( _
    byref a as const Vector3I,    _
    byref b as const Vector3I     _
) as integer

'' function: AngleBetween
''  Returns the angle between two vectors.
declare function AngleBetween overload ( _
    byref a as const Vector3I,    _
    byref b as const Vector3I     _
) as integer

'' function: global operator - (negate)
''  Returns a * -1.
declare operator - ( _
    byval a as Vector3I     _
) as Vector3I

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of two vectors.
declare operator + ( _
    byval a as Vector3I,    _
    byval b as Vector3I     _
) as Vector3I

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of a vector and a scalar.
declare operator + ( _
    byval a as Vector3I,    _
    byval k as integer      _
) as Vector3I

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of two vectors.
declare operator - ( _
    byval a as Vector3I,    _
    byval b as Vector3I     _
) as Vector3I

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of a vector and a scalar.
declare operator - ( _
    byval a as Vector3I,    _
    byval k as integer      _
) as Vector3I

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of two vectors.
declare operator * ( _
    byval a as Vector3I,    _
    byval b as Vector3I     _
) as Vector3I

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of a vector and a scalar.
declare operator * ( _
    byval a as Vector3I,    _
    byval k as integer      _
) as Vector3I

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of two vectors.
declare operator / ( _
    byval a as Vector3I,    _
    byval b as Vector3I     _
) as Vector3I

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of a vector and a scalar.
declare operator / ( _
    byval a as Vector3I,    _
    byval k as integer      _
) as Vector3I

end namespace
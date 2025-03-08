#include once "fbemath/common.bi"

namespace math

''Class: Vector3F
''Represents a 3 dimensional point of type.
type Vector3F
    x as single
    y as single
    z as single
    
    '' sub: default constructor
    declare constructor ( _
    )
    
    '' sub: component constructor
    declare constructor ( _
        byval x as single, _
        byval y as single, _
        byval z as single  _
    )
    
    '' sub: copy constructor
    declare constructor ( _
        byref v as const Vector3F _
    )
    
    '' sub: copy operator let
    declare operator let ( _
        byref v as const Vector3F _
    )
    
    '' sub: operator cast as string
    declare operator cast () as string
    
    '' function: Magnitude
    declare const function Magnitude ( _
    ) as single
    
    '' sub: Normalize
    declare sub Normalize ( _
    )
    
    '' function: Normal
    declare const function Normal ( _
    ) as Vector3F
    
    '' function: Dot
    declare const function Dot ( _
        byref v as const Vector3F _
    ) as single
    
    '' function: Cross
    declare const function Cross ( _
        byref v as const Vector3F _
    ) as Vector3F
    
    declare operator += ( byval v as Vector3F )
    declare operator += ( byval k as single )
    declare operator -= ( byval v as Vector3F )
    declare operator -= ( byval k as single )
    declare operator *= ( byval v as Vector3F )
    declare operator *= ( byval k as single )
    declare operator /= ( byval v as Vector3F )
    declare operator /= ( byval k as single )
    
    '' function: Distance
    ''  Returns the distance between the endpoints of the vector and
    ''  another.
    declare const function Distance ( byref v as const Vector3F ) as single
    
    '' function: AngleBetween
    ''  Returns the angle between the vector and another.
    declare const function AngleBetween ( byref v as const Vector3F ) as single

end type

'' function: Distance
''  Returns the distance between the endpoints of two vectors.
declare function Distance overload ( _
    byref a as const Vector3F,    _
    byref b as const Vector3F     _
) as single

'' function: AngleBetween
''  Returns the angle between two vectors.
declare function AngleBetween overload ( _
    byref a as const Vector3F,    _
    byref b as const Vector3F     _
) as single

'' function: global operator - (negate)
''  Returns a * -1.
declare operator - ( _
    byval a as Vector3F     _
) as Vector3F

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of two vectors.
declare operator + ( _
    byval a as Vector3F,    _
    byval b as Vector3F     _
) as Vector3F

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of a vector and a scalar.
declare operator + ( _
    byval a as Vector3F,    _
    byval k as single      _
) as Vector3F

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of two vectors.
declare operator - ( _
    byval a as Vector3F,    _
    byval b as Vector3F     _
) as Vector3F

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of a vector and a scalar.
declare operator - ( _
    byval a as Vector3F,    _
    byval k as single      _
) as Vector3F

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of two vectors.
declare operator * ( _
    byval a as Vector3F,    _
    byval b as Vector3F     _
) as Vector3F

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of a vector and a scalar.
declare operator * ( _
    byval a as Vector3F,    _
    byval k as single      _
) as Vector3F

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of two vectors.
declare operator / ( _
    byval a as Vector3F,    _
    byval b as Vector3F     _
) as Vector3F

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of a vector and a scalar.
declare operator / ( _
    byval a as Vector3F,    _
    byval k as single      _
) as Vector3F

end namespace
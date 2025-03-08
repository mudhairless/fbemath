#include once "fbemath/common.bi"

namespace math

''Class: Vector3S
''Represents a 3 dimensional point of type.
type Vector3S
    x as short
    y as short
    z as short
    
    '' sub: default constructor
    declare constructor ( _
    )
    
    '' sub: component constructor
    declare constructor ( _
        byval x as short, _
        byval y as short, _
        byval z as short  _
    )
    
    '' sub: copy constructor
    declare constructor ( _
        byref v as const Vector3S _
    )
    
    '' sub: copy operator let
    declare operator let ( _
        byref v as const Vector3S _
    )
    
    '' sub: operator cast as string
    declare operator cast () as string
    
    '' function: Magnitude
    declare const function Magnitude ( _
    ) as short
    
    '' sub: Normalize
    declare sub Normalize ( _
    )
    
    '' function: Normal
    declare const function Normal ( _
    ) as Vector3S
    
    '' function: Dot
    declare const function Dot ( _
        byref v as const Vector3S _
    ) as short
    
    '' function: Cross
    declare const function Cross ( _
        byref v as const Vector3S _
    ) as Vector3S
    
    declare operator += ( byval v as Vector3S )
    declare operator += ( byval k as short )
    declare operator -= ( byval v as Vector3S )
    declare operator -= ( byval k as short )
    declare operator *= ( byval v as Vector3S )
    declare operator *= ( byval k as short )
    declare operator /= ( byval v as Vector3S )
    declare operator /= ( byval k as short )
    
    '' function: Distance
    ''  Returns the distance between the endpoints of the vector and
    ''  another.
    declare const function Distance ( byref v as const Vector3S ) as short
    
    '' function: AngleBetween
    ''  Returns the angle between the vector and another.
    declare const function AngleBetween ( byref v as const Vector3S ) as short

end type

'' function: Distance
''  Returns the distance between the endpoints of two vectors.
declare function Distance overload ( _
    byref a as const Vector3S,    _
    byref b as const Vector3S     _
) as short

'' function: AngleBetween
''  Returns the angle between two vectors.
declare function AngleBetween overload ( _
    byref a as const Vector3S,    _
    byref b as const Vector3S     _
) as short

'' function: global operator - (negate)
''  Returns a * -1.
declare operator - ( _
    byval a as Vector3S     _
) as Vector3S

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of two vectors.
declare operator + ( _
    byval a as Vector3S,    _
    byval b as Vector3S     _
) as Vector3S

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of a vector and a scalar.
declare operator + ( _
    byval a as Vector3S,    _
    byval k as short      _
) as Vector3S

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of two vectors.
declare operator - ( _
    byval a as Vector3S,    _
    byval b as Vector3S     _
) as Vector3S

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of a vector and a scalar.
declare operator - ( _
    byval a as Vector3S,    _
    byval k as short      _
) as Vector3S

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of two vectors.
declare operator * ( _
    byval a as Vector3S,    _
    byval b as Vector3S     _
) as Vector3S

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of a vector and a scalar.
declare operator * ( _
    byval a as Vector3S,    _
    byval k as short      _
) as Vector3S

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of two vectors.
declare operator / ( _
    byval a as Vector3S,    _
    byval b as Vector3S     _
) as Vector3S

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of a vector and a scalar.
declare operator / ( _
    byval a as Vector3S,    _
    byval k as short      _
) as Vector3S

end namespace
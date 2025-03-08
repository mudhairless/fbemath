#include once "fbemath/common.bi"

namespace math

''Class: Vector3D
''Represents a 3 dimensional point of type.
type Vector3D
    x as double
    y as double
    z as double
    
    '' sub: default constructor
    declare constructor ( _
    )
    
    '' sub: component constructor
    declare constructor ( _
        byval x as double, _
        byval y as double, _
        byval z as double  _
    )
    
    '' sub: copy constructor
    declare constructor ( _
        byref v as const Vector3D _
    )
    
    '' sub: copy operator let
    declare operator let ( _
        byref v as const Vector3D _
    )
    
    '' sub: operator cast as string
    declare operator cast () as string
    
    '' function: Magnitude
    declare const function Magnitude ( _
    ) as double
    
    '' sub: Normalize
    declare sub Normalize ( _
    )
    
    '' function: Normal
    declare const function Normal ( _
    ) as Vector3D
    
    '' function: Dot
    declare const function Dot ( _
        byref v as const Vector3D _
    ) as double
    
    '' function: Cross
    declare const function Cross ( _
        byref v as const Vector3D _
    ) as Vector3D
    
    declare operator += ( byval v as Vector3D )
    declare operator += ( byval k as double )
    declare operator -= ( byval v as Vector3D )
    declare operator -= ( byval k as double )
    declare operator *= ( byval v as Vector3D )
    declare operator *= ( byval k as double )
    declare operator /= ( byval v as Vector3D )
    declare operator /= ( byval k as double )
    
    '' function: Distance
    ''  Returns the distance between the endpoints of the vector and
    ''  another.
    declare const function Distance ( byref v as const Vector3D ) as double
    
    '' function: AngleBetween
    ''  Returns the angle between the vector and another.
    declare const function AngleBetween ( byref v as const Vector3D ) as double

end type

'' function: Distance
''  Returns the distance between the endpoints of two vectors.
declare function Distance overload ( _
    byref a as const Vector3D,    _
    byref b as const Vector3D     _
) as double

'' function: AngleBetween
''  Returns the angle between two vectors.
declare function AngleBetween overload ( _
    byref a as const Vector3D,    _
    byref b as const Vector3D     _
) as double

'' function: global operator - (negate)
''  Returns a * -1.
declare operator - ( _
    byval a as Vector3D     _
) as Vector3D

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of two vectors.
declare operator + ( _
    byval a as Vector3D,    _
    byval b as Vector3D     _
) as Vector3D

'' function: global operator +
''  Returns a vector whose components are the sum of the corresponding
''  components of a vector and a scalar.
declare operator + ( _
    byval a as Vector3D,    _
    byval k as double      _
) as Vector3D

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of two vectors.
declare operator - ( _
    byval a as Vector3D,    _
    byval b as Vector3D     _
) as Vector3D

'' function: global operator -
''  Returns a vector whose components are the difference of the
''  corresponding components of a vector and a scalar.
declare operator - ( _
    byval a as Vector3D,    _
    byval k as double      _
) as Vector3D

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of two vectors.
declare operator * ( _
    byval a as Vector3D,    _
    byval b as Vector3D     _
) as Vector3D

'' function: global operator *
''  Returns a vector whose components are the product of the
''  corresponding components of a vector and a scalar.
declare operator * ( _
    byval a as Vector3D,    _
    byval k as double      _
) as Vector3D

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of two vectors.
declare operator / ( _
    byval a as Vector3D,    _
    byval b as Vector3D     _
) as Vector3D

'' function: global operator /
''  Returns a vector whose components are the quotient of the
''  corresponding components of a vector and a scalar.
declare operator / ( _
    byval a as Vector3D,    _
    byval k as double      _
) as Vector3D

end namespace
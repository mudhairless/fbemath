#include once "fbemath/common.bi"
#include once "fbemath/vector2/vector2d.bi"

namespace math

''Class: Line2D
''Represents a Line segment defined by 2 Vector2Ds
''
type Line2D

    ''Variable: a
    ''Vector2( type ) representing the start of the line segment.
    ''
    a as Vector2D

    ''Variable: b
    ''Vector2( type ) representing the end of the line segment.
    b as Vector2D

    '' sub: default constructor
    declare constructor ( _
    )

    '' sub: component constructor
    declare constructor ( _
        byval a as Vector2D, _
        byval b as Vector2D  _
    )

    '' sub: copy constructor
    declare constructor ( _
        byref l as const Line2D _
    )

    '' sub: copy operator let
    declare operator let ( _
        byref l as const Line2D _
    )

end type

end namespace
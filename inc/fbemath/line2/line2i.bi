#include once "fbemath/common.bi"
#include once "fbemath/vector2/vector2i.bi"

namespace math

''Class: Line2I
''Represents a Line segment defined by 2 Vector2Ds
''
type Line2I

    ''Variable: a
    ''Vector2( type ) representing the start of the line segment.
    ''
    a as Vector2I

    ''Variable: b
    ''Vector2( type ) representing the end of the line segment.
    b as Vector2I

    '' sub: default constructor
    declare constructor ( _
    )

    '' sub: component constructor
    declare constructor ( _
        byval a as Vector2I, _
        byval b as Vector2I  _
    )

    '' sub: copy constructor
    declare constructor ( _
        byref l as const Line2I _
    )

    '' sub: copy operator let
    declare operator let ( _
        byref l as const Line2I _
    )

end type

end namespace
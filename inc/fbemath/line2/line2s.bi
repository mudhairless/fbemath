#include once "fbemath/common.bi"
#include once "fbemath/vector2/vector2s.bi"

namespace math

''Class: Line2S
''Represents a Line segment defined by 2 Vector2Ds
''
type Line2S

    ''Variable: a
    ''Vector2( type ) representing the start of the line segment.
    ''
    a as Vector2S

    ''Variable: b
    ''Vector2( type ) representing the end of the line segment.
    b as Vector2S

    '' sub: default constructor
    declare constructor ( _
    )

    '' sub: component constructor
    declare constructor ( _
        byval a as Vector2S, _
        byval b as Vector2S  _
    )

    '' sub: copy constructor
    declare constructor ( _
        byref l as const Line2S _
    )

    '' sub: copy operator let
    declare operator let ( _
        byref l as const Line2S _
    )

end type

end namespace
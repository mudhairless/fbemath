#include once "fbemath/common.bi"
#include once "fbemath/line2.bi"
#include once "fbemath/vector2.bi"

namespace math
'' function: GetProjectedPoint
''  Finds the closest point on a line from a point in 2D space.
''
'' parameters:
''  l - a line.
''  p - a point.
declare function GetProjectedPoint overload ( _
    byval l as Line2D, _
    byval p as Vector2D _
) as Vector2D
declare function GetProjectedPoint overload ( _
    byval l as Line2F, _
    byval p as Vector2F _
) as Vector2F
declare function GetProjectedPoint overload ( _
    byval l as Line2I, _
    byval p as Vector2I _
) as Vector2I
declare function GetProjectedPoint overload ( _
    byval l as Line2S, _
    byval p as Vector2S _
) as Vector2S

'' function: ClampProjectedPoint
''  Finds the closest point on a line segment from a point in 2D space.
''
'' parameters:
''  l - a line segment.
''  p - a point.
declare function ClampProjectedPoint overload ( _
    byval l as Line2D, _
    byval p as Vector2D _
) as Vector2D
declare function ClampProjectedPoint overload ( _
    byval l as Line2F, _
    byval p as Vector2F _
) as Vector2F
declare function ClampProjectedPoint overload ( _
    byval l as Line2I, _
    byval p as Vector2I _
) as Vector2I
declare function ClampProjectedPoint overload ( _
    byval l as Line2S, _
    byval p as Vector2S _
) as Vector2S

end namespace
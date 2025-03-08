#include once "fbemath/common.bi"
#include once "fbemath/line2.bi"

namespace math

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, true is returned.
declare function Intersects overload ( _
    byval a as Line2D,          _
    byval b as Line2D           _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, if the line segments intersect at a point, then
''  `solution` is assigned this value. Otherwise, if the line segments
''  overlap (are coincident), then `solution` is assigned the value of the
''  midpoint of the overlap. In either case, true is returned.
declare function Intersects overload ( _
    byval a as Line2D,          _
    byval b as Line2D,          _
    byref solution as Vector2D  _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, true is returned.
declare function Intersects overload ( _
    byval a as Line2F,          _
    byval b as Line2F           _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, if the line segments intersect at a point, then
''  `solution` is assigned this value. Otherwise, if the line segments
''  overlap (are coincident), then `solution` is assigned the value of the
''  midpoint of the overlap. In either case, true is returned.
declare function Intersects overload ( _
    byval a as Line2F,          _
    byval b as Line2F,          _
    byref solution as Vector2F  _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, true is returned.
declare function Intersects overload ( _
    byval a as Line2I,          _
    byval b as Line2I           _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, if the line segments intersect at a point, then
''  `solution` is assigned this value. Otherwise, if the line segments
''  overlap (are coincident), then `solution` is assigned the value of the
''  midpoint of the overlap. In either case, true is returned.
declare function Intersects overload ( _
    byval a as Line2I,          _
    byval b as Line2I,          _
    byref solution as Vector2I  _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, true is returned.
declare function Intersects overload ( _
    byval a as Line2S,          _
    byval b as Line2S           _
) as boolean

'' function: Intersects
''  Determines if two line segments intersect or overlap. If not, false is
''  returned. Otherwise, if the line segments intersect at a point, then
''  `solution` is assigned this value. Otherwise, if the line segments
''  overlap (are coincident), then `solution` is assigned the value of the
''  midpoint of the overlap. In either case, true is returned.
declare function Intersects overload ( _
    byval a as Line2S,          _
    byval b as Line2S,          _
    byref solution as Vector2S  _
) as boolean

end namespace
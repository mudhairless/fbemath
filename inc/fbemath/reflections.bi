#include once "fbemath/common.bi"
#include once "fbemath/line2.bi"
#include once "fbemath/vector2.bi"

namespace math

'' function: GetReflectedVector
declare function GetReflectedVector overload ( _
    byval v as Vector2D, _
    byval surfaceNormal as Vector2D _
) as Vector2D
declare function GetReflectedVector overload ( _
    byval v as Vector2F, _
    byval surfaceNormal as Vector2F _
) as Vector2F
declare function GetReflectedVector overload ( _
    byval v as Vector2I, _
    byval surfaceNormal as Vector2I _
) as Vector2I
declare function GetReflectedVector overload ( _
    byval v as Vector2S, _
    byval surfaceNormal as Vector2S _
) as Vector2S

'' function: GetReflectedVector
declare function GetReflectedVector overload ( _
    byval v as Vector2D, _
    byval l as Line2D _
) as Vector2D
declare function GetReflectedVector overload ( _
    byval v as Vector2F, _
    byval l as Line2F _
) as Vector2F
declare function GetReflectedVector overload ( _
    byval v as Vector2I, _
    byval l as Line2I _
) as Vector2I
declare function GetReflectedVector overload ( _
    byval v as Vector2S, _
    byval l as Line2S _
) as Vector2S

end namespace
#include once "fbemath/reflections.bi"

namespace math
''double
'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2D, _
    byval surfaceNormal as Vector2D _
) as Vector2D

    return surfaceNormal * 2 * v.Dot( surfaceNormal ) - v

end function

'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2D, _
    byval l as Line2D _
) as Vector2D

    return GetReflectedVector( v, l.b - l.a )

end function

''single
'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2F, _
    byval surfaceNormal as Vector2F _
) as Vector2F

    return surfaceNormal * 2 * v.Dot( surfaceNormal ) - v

end function

'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2F, _
    byval l as Line2F _
) as Vector2F

    return GetReflectedVector( v, l.b - l.a )

end function

''integer
'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2I, _
    byval surfaceNormal as Vector2I _
) as Vector2I

    return surfaceNormal * 2 * v.Dot( surfaceNormal ) - v

end function

'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2I, _
    byval l as Line2I _
) as Vector2I

    return GetReflectedVector( v, l.b - l.a )

end function

''short
'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2S, _
    byval surfaceNormal as Vector2S _
) as Vector2S

    return surfaceNormal * 2 * v.Dot( surfaceNormal ) - v

end function

'' :::::
    function GetReflectedVector overload ( _
    byval v as Vector2S, _
    byval l as Line2S _
) as Vector2S

    return GetReflectedVector( v, l.b - l.a )

end function

end namespace
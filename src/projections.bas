#include once "fbemath/projections.bi"

namespace math
'' double

'' :::::
 function GetProjectedPoint overload ( _
    byval l as Line2D, _
    byval p as Vector2D _
) as Vector2D

    var a = l.a, b = l.b

    var AP = p - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    return a + ABNormal * t

end function

'' :::::
 function ClampProjectedPoint overload ( _
    byval l as Line2D, _
    byval p as Vector2D _
) as Vector2D

    var a = l.a, b = l.b

    var AP = P - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    ' projected point (pp) is outside the line ?
    ' [pp a------b   ] ?
    if t <= 0 then return a
    ' [   a------b pp] ?
    if t >= d then return b

    ' projected point is on the line.
    ' [   a--pp--b   ]
    return a + ABNormal * t

end function

''single
'' :::::
 function GetProjectedPoint overload ( _
    byval l as Line2F, _
    byval p as Vector2F _
) as Vector2F

    var a = l.a, b = l.b

    var AP = p - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    return a + ABNormal * t

end function

'' :::::
 function ClampProjectedPoint overload ( _
    byval l as Line2F, _
    byval p as Vector2F _
) as Vector2F

    var a = l.a, b = l.b

    var AP = P - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    ' projected point (pp) is outside the line ?
    ' [pp a------b   ] ?
    if t <= 0 then return a
    ' [   a------b pp] ?
    if t >= d then return b

    ' projected point is on the line.
    ' [   a--pp--b   ]
    return a + ABNormal * t

end function

''integer
'' :::::
 function GetProjectedPoint overload ( _
    byval l as Line2I, _
    byval p as Vector2I _
) as Vector2I

    var a = l.a, b = l.b

    var AP = p - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    return a + ABNormal * t

end function

'' :::::
 function ClampProjectedPoint overload ( _
    byval l as Line2I, _
    byval p as Vector2I _
) as Vector2I

    var a = l.a, b = l.b

    var AP = P - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    ' projected point (pp) is outside the line ?
    ' [pp a------b   ] ?
    if t <= 0 then return a
    ' [   a------b pp] ?
    if t >= d then return b

    ' projected point is on the line.
    ' [   a--pp--b   ]
    return a + ABNormal * t

end function

'' short
'' :::::
 function GetProjectedPoint overload ( _
    byval l as Line2S, _
    byval p as Vector2S _
) as Vector2S

    var a = l.a, b = l.b

    var AP = p - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    return a + ABNormal * t

end function

'' :::::
 function ClampProjectedPoint overload ( _
    byval l as Line2S, _
    byval p as Vector2S _
) as Vector2S

    var a = l.a, b = l.b

    var AP = P - a
    var ABNormal = (b - a).Normal()

    var d = a.Distance( b )
    var t = ABNormal.Dot( AP )

    ' projected point (pp) is outside the line ?
    ' [pp a------b   ] ?
    if t <= 0 then return a
    ' [   a------b pp] ?
    if t >= d then return b

    ' projected point is on the line.
    ' [   a--pp--b   ]
    return a + ABNormal * t

end function

end namespace
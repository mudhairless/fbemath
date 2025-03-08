#include once "fbemath/line2/line2d.bi"

namespace math

'' :::::
constructor Line2D ( )
    dim p as Vector2D
    this.a = p
    this.b = p
end constructor

'' :::::
constructor Line2D (     byval a as Vector2D,             byval b as Vector2D          )
    this.a = a
    this.b = b
end constructor

'' :::::
constructor Line2D (     byref l as const Line2D )
    this.a = l.a
    this.b = l.b
end constructor

'' :::::
operator Line2D.let (     byref l as const Line2D )
    this.a = l.a
    this.b = l.b
end operator

end namespace
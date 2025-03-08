#include once "fbemath/line2/line2f.bi"

namespace math

'' :::::
constructor Line2F ( )
    dim p as Vector2F
    this.a = p
    this.b = p
end constructor

'' :::::
constructor Line2F (     byval a as Vector2F,             byval b as Vector2F         )
    this.a = a
    this.b = b
end constructor

'' :::::
constructor Line2F (     byref l as const Line2F )
    this.a = l.a
    this.b = l.b
end constructor

'' :::::
operator Line2F.let (     byref l as const Line2F )
    this.a = l.a
    this.b = l.b
end operator

end namespace
#include once "fbemath/line2/line2i.bi"

namespace math

'' :::::
constructor Line2I ( )
    dim p as Vector2I
    this.a = p
    this.b = p
end constructor

'' :::::
constructor Line2I (     byval a as Vector2I,             byval b as Vector2I          )
    this.a = a
    this.b = b
end constructor

'' :::::
constructor Line2I (     byref l as const Line2I )
    this.a = l.a
    this.b = l.b
end constructor

'' :::::
operator Line2I.let (     byref l as const Line2I )
    this.a = l.a
    this.b = l.b
end operator

end namespace

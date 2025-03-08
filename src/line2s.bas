#include once "fbemath/line2/line2s.bi"

namespace math

'' :::::
constructor Line2S ( )
    dim p as Vector2S
    this.a = p
    this.b = p
end constructor

'' :::::
constructor Line2S (     byval a as Vector2S,             byval b as Vector2S          )
    this.a = a
    this.b = b
end constructor

'' :::::
constructor Line2S (     byref l as const Line2S )
    this.a = l.a
    this.b = l.b
end constructor

'' :::::
operator Line2S.let (     byref l as const Line2S )
    this.a = l.a
    this.b = l.b
end operator

end namespace
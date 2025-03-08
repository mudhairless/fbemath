#include once "fbemath/matrix/matrixf.bi"
#include once "crt/string.bi"

namespace math

'' :::::
constructor matrixF ( byref c as single = 0)

    for i as integer = 0 to 15
        this.m(i) = c
    next

end constructor

'' :::::
constructor matrixF ( byref r as Vector3F, byref u as Vector3F, byref f as Vector3F, byref p as Vector3F )

    this.m(0)  = r.x
    this.m(1)  = r.y
    this.m(2)  = r.z
    this.m(3)  = 0

    this.m(4)  = u.x
    this.m(5)  = u.y
    this.m(6)  = u.z
    this.m(7)  = 0

    this.m(8)  = f.x
    this.m(9)  = f.y
    this.m(10) = f.z
    this.m(11) = 0

    this.m(12) = p.x
    this.m(13) = p.y
    this.m(14) = p.z
    this.m(15) = 1

end constructor

'' :::::
constructor matrixF ( byref x as matrixF )
    memcpy(@m(0), @x.m(0), sizeof(single) * 16)
end constructor

'' :::::
function matrixF.Identity ( ) as matrixF

    var res = matrixF()

    res.m(0 )  = 1
    res.m(1 )  = 0
    res.m(2 )  = 0
    res.m(3 )  = 0

    res.m(4 )  = 0
    res.m(5 )  = 1
    res.m(6 )  = 0
    res.m(7 )  = 0

    res.m(8 )  = 0
    res.m(9 )  = 0
    res.m(10)  = 1
    res.m(11)  = 0

    res.m(12)  = 0
    res.m(13)  = 0
    res.m(14)  = 0
    res.m(15)  = 1

    return res

end function

'' :::::
sub matrixF.LoadIdentity()
    m(0 )  = 1
    m(1 )  = 0
    m(2 )  = 0
    m(3 )  = 0

    m(4 )  = 0
    m(5 )  = 1
    m(6 )  = 0
    m(7 )  = 0

    m(8 )  = 0
    m(9 )  = 0
    m(10)  = 1
    m(11)  = 0

    m(12)  = 0
    m(13)  = 0
    m(14)  = 0
    m(15)  = 1
end sub

'' :::::
operator matrixF.*= ( byref mat as matrixF )

    dim as single tmp_m(15) = any

    tmp_m(0)  = (mat.m(0)  * this.m(0))+(mat.m(1)  * this.m(4))+(mat.m(2)  * this.m(8)) +(mat.m(3)  * this.m(12))
    tmp_m(1)  = (mat.m(0)  * this.m(1))+(mat.m(1)  * this.m(5))+(mat.m(2)  * this.m(9)) +(mat.m(3)  * this.m(13))
    tmp_m(2)  = (mat.m(0)  * this.m(2))+(mat.m(1)  * this.m(6))+(mat.m(2)  * this.m(10))+(mat.m(3)  * this.m(14))
    tmp_m(3)  = (mat.m(0)  * this.m(3))+(mat.m(1)  * this.m(7))+(mat.m(2)  * this.m(11))+(mat.m(3)  * this.m(15))
    tmp_m(4)  = (mat.m(4)  * this.m(0))+(mat.m(5)  * this.m(4))+(mat.m(6)  * this.m(8)) +(mat.m(7)  * this.m(12))
    tmp_m(5)  = (mat.m(4)  * this.m(1))+(mat.m(5)  * this.m(5))+(mat.m(6)  * this.m(9)) +(mat.m(7)  * this.m(13))
    tmp_m(6)  = (mat.m(4)  * this.m(2))+(mat.m(5)  * this.m(6))+(mat.m(6)  * this.m(10))+(mat.m(7)  * this.m(14))
    tmp_m(7)  = (mat.m(4)  * this.m(3))+(mat.m(5)  * this.m(7))+(mat.m(6)  * this.m(11))+(mat.m(7)  * this.m(15))
    tmp_m(8)  = (mat.m(8)  * this.m(0))+(mat.m(9)  * this.m(4))+(mat.m(10) * this.m(8)) +(mat.m(11) * this.m(12))
    tmp_m(9)  = (mat.m(8)  * this.m(1))+(mat.m(9)  * this.m(5))+(mat.m(10) * this.m(9)) +(mat.m(11) * this.m(13))
    tmp_m(10) = (mat.m(8)  * this.m(2))+(mat.m(9)  * this.m(6))+(mat.m(10) * this.m(10))+(mat.m(11) * this.m(14))
    tmp_m(11) = (mat.m(8)  * this.m(3))+(mat.m(9)  * this.m(7))+(mat.m(10) * this.m(11))+(mat.m(11) * this.m(15))
    tmp_m(12) = (mat.m(12) * this.m(0))+(mat.m(13) * this.m(4))+(mat.m(14) * this.m(8)) +(mat.m(15) * this.m(12))
    tmp_m(13) = (mat.m(12) * this.m(1))+(mat.m(13) * this.m(5))+(mat.m(14) * this.m(9)) +(mat.m(15) * this.m(13))
    tmp_m(14) = (mat.m(12) * this.m(2))+(mat.m(13) * this.m(6))+(mat.m(14) * this.m(10))+(mat.m(15) * this.m(14))
    tmp_m(15) = (mat.m(12) * this.m(3))+(mat.m(13) * this.m(7))+(mat.m(14) * this.m(11))+(mat.m(15) * this.m(15))

    memcpy(@this.m(0), @tmp_m(0), 16 * sizeof(single))

end operator

'' :::::
operator *( byref lhs as matrixF, byref rhs as matrixF ) as matrixF

    var tmp = lhs
    tmp *= rhs
    return tmp

end operator

'' :::::
operator matrixF.cast() as string

    dim as string mstring
    for i as integer = 0 to 15
        if i<10 then
            mstring += trim("(" & i & " ) " & this.m(i)) & chr(13,10)
        else
            mstring += trim("(" & i & ") " & this.m(i)) & chr(13,10)
        end if
    next
    return mstring

end operator

operator matrixF.cast() as single ptr
    return @this.m(0)
end operator


'' :::::
operator * ( byref lhs as Vector2F, byref rhs as matrixF ) as Vector2F

    return type<Vector2F>( lhs.x*rhs.getarraydata[0] + lhs.y*rhs.getarraydata[4] + rhs.getarraydata[12], _
    lhs.x*rhs.getarraydata[1] + lhs.y*rhs.getarraydata[5] + rhs.getarraydata[13] )


end operator

'' :::::
operator * ( byref lhs as Vector3F, byref rhs as matrixF ) as Vector3F

    return type<Vector3F>( lhs.x*rhs.getarraydata[0] + lhs.y*rhs.getarraydata[4] + lhs.z*rhs.getarraydata[8]  + rhs.getarraydata[12], _
    lhs.x*rhs.getarraydata[1] + lhs.Y*rhs.getarraydata[5] + lhs.Z*rhs.getarraydata[9]  + rhs.getarraydata[13], _
    lhs.x*rhs.getarraydata[2] + lhs.Y*rhs.getarraydata[6] + lhs.Z*rhs.getarraydata[10] + rhs.getarraydata[14] )

end operator

'' :::::
operator * ( byref lhs as Vector4F, byref rhs as matrixF ) as Vector4F

    return type<Vector4F>( lhs.x*rhs.getarraydata[0] + lhs.y*rhs.getarraydata[4] + lhs.z*rhs.getarraydata[8]  + rhs.getarraydata[12], _
    lhs.x*rhs.getarraydata[1] + lhs.Y*rhs.getarraydata[5] + lhs.Z*rhs.getarraydata[9]  + rhs.getarraydata[13], _
    lhs.x*rhs.getarraydata[2] + lhs.Y*rhs.getarraydata[6] + lhs.Z*rhs.getarraydata[10] + rhs.getarraydata[14], lhs.w  )

end operator



'' :::::
sub matrixF.LookAt( byref v1 as Vector3F, byref v2 as Vector3F, byref vup as Vector3F )
    dim as Vector3F d = v1-v2
    d.normalize
    dim as Vector3F r = d.cross(vup)
    dim as Vector3F u = r.cross(d)
    r.normalize
    u.normalize

    this.m(0)  = -r.x
    this.m(1)  = u.x
    this.m(2)  = d.x
    this.m(3)  = 0.0

    this.m(4)  = -r.y
    this.m(5)  = u.y
    this.m(6)  = d.y
    this.m(7)  = 0.0

    this.m(8)  = -r.z
    this.m(9)  = u.z
    this.m(10) = d.z
    this.m(11) = 0

    this.m(12)  = 0.0
    this.m(13)  = 0.0
    this.m(14)  = 0.0
    this.m(15)  = 1.0

    dim as matrixF matrix2
    matrix2.LoadIdentity
    matrix2.Position =-v1
    this*= matrix2
end sub


'' :::::
sub matrixF.PointAt( byref v1 as Vector3F, byref v2 as Vector3F )

    dim as Vector3F d = v1-v2
    d.normalize
    dim as Vector3F u = Vector3F(0,-1,0)
    dim as Vector3F r = d.cross(u)
    r.normalize
    u = -r.cross(d)
    u.normalize

    this.m(0)  = r.x
    this.m(1)  = r.y
    this.m(2)  = r.z
    this.m(3)  = 0.0

    this.m(4)  = u.x
    this.m(5)  = u.y
    this.m(6)  = u.z
    this.m(7)  = 0.0

    this.m(8)  = d.x
    this.m(9)  = d.y
    this.m(10) = d.z
    this.m(11) = 0.0

    this.m(12)  = v1.x
    this.m(13)  = v1.y
    this.m(14)  = v1.z
    this.m(15)  = 1.0

end sub


'' :::::
function matrixF.Inverse() as matrixF

    dim as matrixF inverted
    inverted.m(0)  = this.m(0)
    inverted.m(1)  = this.m(4)
    inverted.m(2)  = this.m(8)
    inverted.m(4)  = this.m(1)
    inverted.m(5)  = this.m(5)
    inverted.m(6)  = this.m(9)
    inverted.m(8)  = this.m(2)
    inverted.m(9)  = this.m(6)
    inverted.m(10) = this.m(10)
    inverted.m(3)  = 0.0f
    inverted.m(7)  = 0.0f
    inverted.m(11) = 0.0f
    inverted.m(15) = 1.0f

    inverted.m(12) = -(this.m(12) * this.m(0)) - (this.m(13) * this.m(1)) - (this.m(14) * this.m(2))
    inverted.m(13) = -(this.m(12) * this.m(4)) - (this.m(13) * this.m(5)) - (this.m(14) * this.m(6))
    inverted.m(14) = -(this.m(12) * this.m(8)) - (this.m(13) * this.m(9)) - (this.m(14) * this.m(10))
    return inverted

end function

'' :::::
sub matrixF.Invert()

    dim tmp_m(15) as single = any

    tmp_m(0)  = this.m(0)
    tmp_m(1)  = this.m(4)
    tmp_m(2)  = this.m(8)
    tmp_m(4)  = this.m(1)
    tmp_m(5)  = this.m(5)
    tmp_m(6)  = this.m(9)
    tmp_m(8)  = this.m(2)
    tmp_m(9)  = this.m(6)
    tmp_m(10) = this.m(10)
    tmp_m(3)  = 0.0f
    tmp_m(7)  = 0.0f
    tmp_m(11) = 0.0f
    tmp_m(15) = 1.0f

    tmp_m(12) = -(this.m(12) * this.m(0)) - (this.m(13) * this.m(1)) - (this.m(14) * this.m(2))
    tmp_m(13) = -(this.m(12) * this.m(4)) - (this.m(13) * this.m(5)) - (this.m(14) * this.m(6))
    tmp_m(14) = -(this.m(12) * this.m(8)) - (this.m(13) * this.m(9)) - (this.m(14) * this.m(10))

    memcpy(@this.m(0), @tmp_m(0), sizeof(single) * 16)

end sub

'' :::::
function matrixF.Invert_copy() as matrixF

    var tmp = this
    tmp.invert()
    return tmp

end function

'' :::::
function matrixF.PlanarProjection( byref lightpos as Vector4F, byref plane as Vector4F ) as matrixF
    var projected_matrix = matrixF()

    with plane
        var xx = .x * lightpos.x
        var yy = .y * lightpos.y
        var zz = .z * lightpos.z
        var ww = .w * lightpos.w
        var dot = xx + yy + zz + ww

        projected_matrix.m( 0) = dot - xx
        projected_matrix.m( 1) = -lightpos.y * .x
        projected_matrix.m( 2) = -lightpos.z * .x
        projected_matrix.m( 3) = -lightpos.w * .x

        projected_matrix.m( 4) = -lightpos.x * .y
        projected_matrix.m( 5) = dot - yy
        projected_matrix.m( 6) = -lightpos.z * .y
        projected_matrix.m( 7) = -lightpos.w * .y

        projected_matrix.m( 8) = -lightpos.x * .z
        projected_matrix.m( 9) = -lightpos.y * .z
        projected_matrix.m(10) = dot - zz
        projected_matrix.m(11) = -lightpos.w * .z

        projected_matrix.m(12) = -lightpos.x * .w
        projected_matrix.m(13) = -lightpos.y * .w
        projected_matrix.m(14) = -lightpos.z * .w
        projected_matrix.m(15) = dot - ww
    end with
    return projected_matrix

end function


sub matrixF.InfiniteProjection( byref fov as single, byref aspectratio as single, byref znear as single )

    this.m(4)  = 0
    this.m(8)  = 0
    this.m(12) = 0
    this.m(1)  = 0
    this.m(9)  = 0
    this.m(13) = 0
    this.m(2)  = 0
    this.m(6)  = 0
    this.m(3)  = 0
    this.m(7)  = 0
    this.m(15) = 0

    this.m(0)  = ( 1f/tan(fov) ) / aspectratio
    this.m(5)  = ( 1f/tan(fov) )
    this.m(14) = -2f * znear
    this.m(10) = -1f
    this.m(11) = -1f

end sub


'' :::::
sub matrixF.AxisAngle( byref v as Vector3F, byref angle as single )
    dim as single tc = cos(angle*pi_180)
    dim as single ts = sin(angle*pi_180)
    dim as single tt = 1 - tc
    v.normalize
    this.m(0)  = tc + v.x*v.x*tt
    this.m(5)  = tc + v.y*v.y*tt
    this.m(10) = tc + v.z*v.z*tt
    dim as single tmp1 = v.x*v.y*tt
    dim as single tmp2 = v.z*ts
    this.m(4) = tmp1 + tmp2
    this.m(1) = tmp1 - tmp2
    tmp1 = v.x*v.z*tt
    tmp2 = v.y*ts
    this.m(8) = tmp1 - tmp2
    this.m(2) = tmp1 + tmp2
    tmp1 = v.y*v.z*tt
    tmp2 = v.x*ts
    this.m(9) = tmp1 + tmp2
    this.m(6) = tmp1 - tmp2
    this.m(15) = 1
end sub

'' :::::
sub matrixF.Translate( byref x as single, byref y as single, byref z as single )

    var t = matrixF()
    t.LoadIdentity
    t.Position = type<Vector3F>(x,y,z)
    this *= t

end sub


'' :::::
sub matrixF.Rotate( byref anglex as single, byref angley as single, byref anglez as single )

    dim as single tcos = any
    dim as single tsin = any
    var tm = matrixF()

    if anglex <> 0 then
        tm.LoadIdentity
        tcos = cos( anglex * pi_180 )
        tsin = sin( anglex * pi_180 )
        tm.m( 5)= tcos
        tm.m( 6)= tsin
        tm.m( 9)=-tsin
        tm.m(10)= tcos
        this *= tm
    end if

    if angley <> 0 then
        tm.LoadIdentity
        tcos = cos( angley * pi_180 )
        tsin = sin( angley * pi_180 )
        tm.m( 0)= tcos
        tm.m( 2)=-tsin
        tm.m( 8)= tsin
        tm.m(10)= tcos
        this *= tm
    end if

    if anglez <> 0 then
        tm.LoadIdentity
        tcos = cos( anglez * pi_180 )
        tsin = sin( anglez * pi_180 )
        tm.m(0) = tcos
        tm.m(1) = tsin
        tm.m(4) =-tsin
        tm.m(5) = tcos
        this *= tm
    end if

end sub

'' :::::
sub matrixF.Scale( byref scalar as single )
    dim as matrixF temp
    temp.LoadIdentity
    temp.m(0)  = scalar
    temp.m(5)  = scalar
    temp.m(10) = scalar
    this*=temp
end sub

'':::::
sub matrixF.Scale( byref scalarx as single, byref scalary as single, byref scalarz as single )
    dim as matrixF temp
    temp.LoadIdentity
    temp.m(0)  = scalarx
    temp.m(5)  = scalary
    temp.m(10) = scalarz
    this*=temp
end sub

'':::::
sub matrixF.Gram_Schmidt( byref d as Vector3F )
    dim as Vector3F r
    dim as Vector3F u
    dim as Vector3F f = d

    f *= ( 1.0 / sqr(f.dot(f)) )

    if abs(f.z) >.577 then
        r = f * type<Vector3F>(-f.y, f.z, 0.0)
    else
        r = f * type<Vector3F>(-f.y, f.x, 0.0)
    end if
    r *= ( 1.0 / sqr(r.dot(r)) )
    u = r * f

    this.LoadIdentity
    this.Forward = f
    this.Up = u
    this.Right = r
    this.Position = type<Vector3F>(0,0,0)
end sub



'' :::::
property matrixF.Right( byref v  as Vector3F )
    m(0) = v.x
    m(1) = v.y
    m(2) = v.z
end property

'' :::::
property matrixF.Up( byref v  as Vector3F )
    m(4) = v.x
    m(5) = v.y
    m(6) = v.z
end property

'' :::::
property matrixF.Forward( byref v  as Vector3F )
    m(8)  = v.x
    m(9)  = v.y
    m(10) = v.z
end property

'' :::::
property matrixF.Position( byref v  as Vector3F )
    m(12) = v.x
    m(13) = v.y
    m(14) = v.z
end property

'' :::::
property matrixF.Right() as Vector3F
    return type<Vector3F>(m(0), m(1), m(2))
end property

'' :::::
property matrixF.Up() as Vector3F
    return type<Vector3F>(m(4), m(5), m(6))
end property

'' :::::
property matrixF.Forward() as Vector3F
    return type<Vector3F>(m(8), m(9), m(10))
end property

'' :::::
property matrixF.Position() as Vector3F
    return type<Vector3F>(m(12), m(13), m(14))
end property


property matrixF.GetArrayData() as single ptr
    return @this.m(0)
end property

end namespace
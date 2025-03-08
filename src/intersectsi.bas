''Copyright (c) 2025 Ebben Feagan
''Copyright (c) 2007-2024, FreeBASIC Extended Library Development Group
''
''All rights reserved.
''
''Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
''
''    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
''    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
''    * Neither the name of the copyright holders nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
''
''THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
''"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
''LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
''A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
''CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
''EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
''PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
''PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
''LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
''NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
''SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include once "fbemath/line2/line2i.bi"

namespace math

'' :::::
 function Intersects overload ( _
    byval a as Line2I,          _
    byval b as Line2I           _
) as boolean

    var v1 = a.b - a.a
    var v2 = b.b - b.a
    var v3 = b.a - a.a
    var cp = (v1.x * v2.y) - (v1.y * v2.x)

    if cp <> 0 then
        var d1 = ((v3.x * v2.y) - (v3.y * v2.x)) / cp
        if 0 <= d1 andalso d1 <= 1 then
            var d2 = ((v3.x * v1.y) - (v3.y * v1.x)) / cp
            if 0 <= d2 andalso d2 <= 1 then
                return true
            end if
        end if
    end if

    return false

end function

'' :::::
 function Intersects overload ( _
    byval a as Line2I,          _
    byval b as Line2I,          _
    byref solution as Vector2I  _
) as boolean

    var v1 = a.b - a.a
    var v2 = b.b - b.a
    var v3 = b.a - a.a
    var cp = (v1.x * v2.y) - (v1.y * v2.x)

    if cp <> 0 then
        var d1 = ((v3.x * v2.y) - (v3.y * v2.x)) / cp
        if 0 <= d1 andalso d1 <= 1 then
            var d2 = ((v3.x * v1.y) - (v3.y * v1.x)) / cp
            if 0 <= d2 andalso d2 <= 1 then
                var m1 = iif( v1.x <> 0.0, v1.y / v1.x, 10000000000.0 )
                var m2 = iif( v2.x <> 0.0, v2.y / v2.x, 10000000000.0 )

                var c1 = a.a.y - (m1 * a.a.x)
                var c2 = b.a.y - (m2 * b.a.x)
                var ant = 1 / -(m1 - m2)
                solution.x = -(c2 - c1) * ant
                solution.y = ((m2 * c1) - (m1 * c2)) * ant

                return true
            end if
        end if
    end if

    return false

end function

end namespace
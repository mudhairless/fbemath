''File: stars.bas
''Description: Demonstration of vectors and matrices.
''
''Copyright (c) 2007-2024 FreeBASIC Extended Library Development Group
''
''Distributed under the FreeBASIC Extended Library Group license. (See
''accompanying file LICENSE.txt or copy at
''https://github.com/FreeBASIC-Extended-Library/fb-ext-lib/blob/master/COPYING)

#include once "fbemath/vector3/vector3f.bi"
#include once "fbemath/matrix/matrixf.bi"
#include once "crt/stdlib.bi"
#include once "fbgfx.bi"

using math

Const as integer SCR_W = 640
Const as integer SCR_H = 480
Const as integer SCR_W2=SCR_W\2
Const as integer SCR_H2=SCR_H\2
Const as integer LENS = (SCR_W+SCR_H)\2

screenres SCR_W,SCR_H,32


Function vertex_sort Cdecl ( Byval elm1 As const Any Ptr, Byval elm2 As const Any Ptr ) As long
    Return Sgn( (Cptr(Vector3F Ptr, elm2)->z) - (Cptr(Vector3F Ptr, elm1)->z) )
End Function

dim as Vector3F vert(5000), tvert( ubound(vert) )
 
'set up some test vertices
for i as integer = lbound(vert) to ubound(vert)
    vert(i) = type<Vector3F>(-1000+rnd*2000,-1000+rnd*2000,-1000+rnd*2000)
    vert(i)*=1.45
next

    dim as Vector3F posit, look
    dim as Vector3F tposit
    dim as Vector3F tlook 
    dim as Vector3F up = Vector3F(0,1,0) 
 
do
    if tposit.distance(posit)<100 then
        tposit = type<Vector3F>(-1000+rnd*2000,-1000+rnd*2000,-1000+rnd*2000)
        tlook = type<Vector3F>(-1000+rnd*2000,-1000+rnd*2000,-1000+rnd*2000)
    end if
    
    posit += (tposit-posit)/50.0
    look  += (tlook-look)/50.0
    
    dim as matrixf m, m2
    m.LookAt( posit, look, up ) 
    
    for i as integer = lbound(vert) to ubound(vert)
        tvert(i) = vert(i)*m
    next
        
    'ext.quicksort( @tvert(0), ubound(tvert), SizeOf(Vector3F), @vertex_sort )
    qsort( @tvert(0), ubound(tvert), sizeof(Vector3F), @vertex_sort )

    screenlock
    line(0,0)-(SCR_W-1,SCR_H-1), 0, BF
    for i as integer = lbound(vert) to ubound(vert)
        dim as Vector3F pnt = tvert(i)
        dim as single dist = pnt.z
        if dist > 0 then
            dim as single size = 20 - dist/80
            if size<0 then size = 0
            dim as integer col = 255-(dist/8)
            if col<0 then col = 0
            circle( SCR_W2 + (LENS * pnt.x/dist),  SCR_H2 - (LENS * pnt.y/dist) ), size, 0,,,,f
            circle step(0,0), size, RGB(col,col,0)
        end if    
    next
    
    screensync
    screenunlock
    
    sleep 1,1
loop until len(inkey)

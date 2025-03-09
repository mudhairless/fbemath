''File: 3drotate.bas
''Description: Demonstration of rotation using vectors and matrices.
''
''Copyright (c) 2007-2024 FreeBASIC Extended Library Development Group
''
''Distributed under the FreeBASIC Extended Library Group license. (See
''accompanying file LICENSE.txt or copy at
''https://github.com/FreeBASIC-Extended-Library/fb-ext-lib/blob/master/COPYING)


#include once "fbemath/vector3/vector3f.bi"
#include once "fbemath/vector2/vector2i.bi"
#include once "fbemath/matrix/matrixf.bi"
#include once "fbgfx.bi"
#include once "crt/stdlib.bi"

using math

declare function Sort cdecl ( byval elm1 as const any ptr, byval elm2 as const any ptr ) as long
declare sub Triangle overload ( byval dst as fb.Image ptr = 0, byref p1 as Vector2I, byref p2 as Vector2I, byref p3 as Vector2I, byval col as ulong = rgba(255,255,255,255) )
declare sub Triangle ( byval dst as fb.Image ptr = 0, byval x1 as integer, byval y1 as integer, byval x2 as integer, byval y2 as integer, byval x3 as integer, byval y3 as integer, byval col as ulong = rgba(255,255,255,255) )
declare sub TriangleASM overload ( byval dst as fb.Image ptr = 0, byval x1 as integer, byval y1 as integer, byval x2 as integer, byval y2 as integer, byval x3 as integer, byval y3 as integer, byval col as ulong = rgba(255,255,255,255) )
declare sub TriangleASM( byval dst as fb.Image ptr = 0, byref p1 as Vector2I, byref p2 as Vector2I, byref p3 as Vector2I, byval col as ulong = rgba(255,255,255,255) )

randomize timer

type tri_struct
    index(1 to 3) as integer'indices into our vertex array... p1,p2,p3
    r as integer'Red color value for this triangle
    g as integer'...
    b as integer'...
    normal as Vector3F' the triangle's normal... used in the lighting calculation
end type

type obj_struct
    max_vertices    as integer'the number of vertices in our model
    max_tris        as integer'the number of triangles in our model
    vertices        as Vector3F ptr'the vertex array... 3d points
    tvertices       as Vector3F ptr'the transformed vertex array
    pvertices       as Vector3F ptr'the projected vertex array
    tris            as tri_struct ptr'our triangle array
end type

type render_struct
    vec(2) as Vector2I
    midpoint as single
    col as uinteger
end type



const as integer SCR_W = 640'screen resolution width
const as integer SCR_H = 480'screen resolution height
const as integer SCR_W2=SCR_W\2'center of screen width
const as integer SCR_H2=SCR_H\2'center of screen height
const as integer aspect = (SCR_W+SCR_H)\2'used for projection calculation

'make a peanut butter sammich...
screenres SCR_W,SCR_H,32,,FB.GFX_HIGH_PRIORITY

'create our initial object... the model
dim as obj_struct obj

'some generic variables Red,Green,Blue and "zNormal" used for culling
dim as integer r, g, b, zN

'some more generic variables and the light
'tlight is used for the transformed light position
dim as Vector3F p, pa, p1, p2, p3, tvec, light = Vector3F(15,15,15), tlight

'even more generic variables... dot product, distance and angle of rotation
dim as single dot, dist, angle

'this is for the sorting function, basically a temp array to hold the sorted vertices and colors
dim as render_struct rBuffer()

'this is for the sorting as well. it keeps track of how many triangles are visible in any one frame
'it's reset each frame... kind of simulating the way opengl works.
dim as integer fCnt

'declare a matrix to transform our model with
dim as matrixf tmatrix

'find out how many vertices our model has by reading
'the first data statement after the MODEL_VERTEX_DATA label
restore MODEL_VERTEX_DATA
read obj.max_vertices

'allocate just enough memory for the vertex arrays
obj.vertices  = new Vector3F[obj.max_vertices]
obj.tvertices = new Vector3F[obj.max_vertices]
obj.pvertices = new Vector3F[obj.max_vertices]

'read the vertex info from the data statements and store it in our main vertex array
for i as integer = 0 to obj.max_vertices-1
    dim as single tx, ty, tz
    read tx, ty, tz
    obj.vertices[i] = Vector3F(tx, ty, tz)
next

'find out how many triangles our model has by reading
'the first data statement after the MODEL_TRIANGLE_DATA label
restore MODEL_TRIANGLE_DATA
read obj.max_tris

'allocate just enough memory for our model's triangles data
obj.tris = new tri_struct[obj.max_tris]

'read the triangle index info from the data statements and store it in our index array
'also, we assign some random color values, calculate the normals and normalize them
for i as integer = 0 to obj.max_tris-1
    dim as integer p1, p2, p3
    read p1, p2, p3
    obj.tris[i].index(1) = p1-1
    obj.tris[i].index(2) = p2-1
    obj.tris[i].index(3) = p3-1
    
    obj.tris[i].r = rnd * 256
    obj.tris[i].g = rnd * 256
    obj.tris[i].b = rnd * 256
    
    obj.tris[i].normal = (obj.vertices[obj.tris[i].index(2)] - obj.vertices[obj.tris[i].index(1)]).cross((obj.vertices[obj.tris[i].index(3)] - obj.vertices[obj.tris[i].index(1)]))
    obj.tris[i].normal.normalize
next

'just some generic variables to keep track of the frames per second
dim as integer FPS_count, method = 2
dim as string FPS_String
dim as double FPS_time, this_time = timer, loop_time

do
    
    if multikey(Fb.SC_SPACE) then
        method += 1
        if method>2 then method = 0
        sleep 250,1
    end if
    
    dim as integer mx, my
    getmouse(mx,my)


    dim as Vector3F tposit = Vector3F( -(320 - mx), 240 - my, 10 )

    'we want to use time to control our movement, since it's so much more accurate
    loop_time = timer - this_time
    this_time = timer
    
               
            'create a matrix which points the model at the mouse cursor...
            tMatrix.PointAt( Vector3F(0,0,-10), tposit )
            
            'loop through all the vertices of the model
            for i as integer = 0 to obj.max_vertices-1
                
                'multiply the model's vertices with our transformation matrix,
                'and store them in our "tvertices" vertex array
                obj.tvertices[i] = obj.vertices[i]*tmatrix
                
                'store the negated z element of our transformed vertex in the dist var
                dist = -obj.tvertices[i].z
                
                'if the distance is positive, we project the vertices onto the 2d screen,
                'and store them in our "pvertices" vertex array
                'we're just doing these things ahead of time to reduce the amount of calculations
                'we must do in the drawing loop
                if dist>0 then
                    
                    obj.pvertices[i].x = SCR_W2 + ( aspect * obj.tvertices[i].x / dist )
                    obj.pvertices[i].y = SCR_H2 - ( aspect * obj.tvertices[i].y / dist )
                    
                end if
                
            next
            
            'transform the light using the matrix inverse
            'if you don't understand why, you can look up 3d lighting transformations
            tlight = light*tmatrix.inverse
            
            'now we loop through all the model's triangles
            for t as integer = 0 to obj.max_tris-1
                
                'store our model's transformed and projected vertices in some temp variables
                p1 = obj.pvertices[ obj.tris[t].index(1) ]
                p2 = obj.pvertices[ obj.tris[t].index(2) ]
                p3 = obj.pvertices[ obj.tris[t].index(3) ]
                
                'calculate the "z normal" to see if this triangle is facing the viewer
                'this is over-simplified here
                'for more info, look up "triangle culling"
                zN = ((p2.x-p1.x)*(p1.y-p3.y)-(p2.y-p1.y)*(p1.x-p3.x))
                
                'if the triangle is facing the viewer, we continue on to draw it
                if zN>0 then
                    
                    'here we're just doing some basic flat shading
                    'for more info, look up "lambert shading"
                    p = ((obj.tvertices[obj.tris[t].index(1)] + obj.tvertices[obj.tris[t].index(2)] + obj.tvertices[obj.tris[t].index(3)]) / 3.0)
                    pa = p*obj.tris[t].normal
                    tvec =  tlight - pa
                    tvec.normalize
                    
                    dot = -2f * acos( tVec.dot(obj.tris[t].normal))/pi2
                    r = obj.tris[t].r + (dot * obj.tris[t].r * 2.75 )            
                    g = obj.tris[t].g + (dot * obj.tris[t].g * 2.75 )            
                    b = obj.tris[t].b + (dot * obj.tris[t].b * 2.75 )
                    
                    if r<0 then 
                        r=0
                    elseif r>255 then
                        r=255
                    end if
                    
                    if g<0 then 
                        g=0
                    elseif g>255 then
                        g=255
                    end if
                    
                    if b<0 then 
                        b=0
                    elseif b>255 then
                        b=255
                    end if
                    
                    
                    redim preserve rbuffer(fcnt)
                    rbuffer(fcnt).midpoint = p.z
                    rbuffer(fcnt).vec(0) = type<Vector2I>(p1.x,p1.y)
                    rbuffer(fcnt).vec(1) = type<Vector2I>(p2.x,p2.y)
                    rbuffer(fcnt).vec(2) = type<Vector2I>(p3.x,p3.y)
                    rbuffer(fcnt).col = rgb(R, G, B)
                    fcnt+=1
                    
                end if
                
            next
    
    
    screenlock
    'clear the screen using a filled black box
    line(0,0)-(SCR_W-1, SCR_H-1),0,bf
    'sort the temp buffer so that the model displays properly
    qsort( @rBuffer(0), fCnt, sizeof(render_struct), @Sort )
    
    'now, actually draw the model using the temp buffer and one of three methods,
    'wireframe, normal filled triangle or an optimized asm filler
    select case as const method
        case 0
            for i as integer = 0 to fCnt-1
                line( rBuffer(i).vec(0).x, rBuffer(i).vec(0).y ) - ( rBuffer(i).vec(1).x, rBuffer(i).vec(1).y ), rBuffer(i).col
                line - ( rBuffer(i).vec(2).x, rBuffer(i).vec(2).y ), rBuffer(i).col
                line - ( rBuffer(i).vec(0).x, rBuffer(i).vec(0).y ), rBuffer(i).col
            next
        case 1
            for i as integer = 0 to fCnt-1
                Triangle( 0, rBuffer(i).vec(0).x, rBuffer(i).vec(0).y, rBuffer(i).vec(1).x, rBuffer(i).vec(1).y, rBuffer(i).vec(2).x, rBuffer(i).vec(2).y, rBuffer(i).col )
            next
        case 2
            for i as integer = 0 to fCnt-1
                TriangleASM( 0, rBuffer(i).vec(0).x, rBuffer(i).vec(0).y, rBuffer(i).vec(1).x, rBuffer(i).vec(1).y, rBuffer(i).vec(2).x, rBuffer(i).vec(2).y, rBuffer(i).col )
            next
    end select
    
    fcnt = 0
    
    
    locate 1,1
    print FPS_string
    
    select case as const method
        case 0
            print "Line"
        case 1
            print "Filled"
        case 2
            print "Filled-ASM"
    end select
    
    'screensync
    
    screenunlock
    
    sleep 1,1
    
    'calculate our frames per second
    FPS_count+=1
    if timer>FPS_time then
        FPS_time = timer+1
        FPS_string = "FPS: " & FPS_count
        FPS_count = 0
    end if
    
loop until multikey(FB.SC_ESCAPE)


'Memory clean up
delete[] obj.tris
delete[] obj.vertices 
delete[] obj.tvertices
delete[] obj.pvertices


function Sort cdecl ( byval elm1 as const any ptr, byval elm2 as const any ptr ) as long
    
    return sgn( (cptr(render_struct ptr, elm1)->midpoint) - (cptr(render_struct ptr, elm2)->midpoint) )
    
end function

sub Triangle ( byval dst as fb.Image ptr = 0, byval x1 as integer, byval y1 as integer, byval x2 as integer, byval y2 as integer, byval x3 as integer, byval y3 as integer, byval col as ulong = rgba(255,255,255,255) )

    dim as ulong ptr dstptr

    dim as integer x, y, dw, dh

    dim as integer dx1, dx2, dx3, dy1, dy2, dy3, sx, ex

    dim as single d1, d2, d3, lx, rx

    if dst = 0 then
        dstptr = screenptr
        screeninfo dw,dh
    else
        dstptr = cast(ulong ptr, cast( ubyte ptr, dst ) + sizeOf( fb.Image ))
        dw = dst->width
        dh = dst->height
    end if

    if y2 < y1 then
        swap y1, y2
        swap x1, x2
    end if

    if y3 < y1 then
        swap y3, y1
        swap x3, x1
    end if

    if y3 < y2 then
        swap y3, y2
        swap x3, x2
    end if

    dx1 = x2 - x1
    dy1 = y2 - y1
    if dy1 <> 0 then
        d1 = dx1 / dy1
    else
        d1 = 0
    end if

    dx2 = x3 - x2
    dy2 = y3 - y2
    if dy2 <> 0 then
        d2 = dx2 / dy2
    else
        d2 = 0
    end if

    dx3 = x1 - x3
    dy3 = y1 - y3
    if dy3 <> 0 then
        d3 = dx3 / dy3
    else
        d3 = 0
    end if

    lx = x1
    rx = x1

    if dst = 0 then
        for y = y1 to y2 - 1
            if y>-1 and y<dh then
                sx = lx
                ex = rx
                if sx>ex then swap sx,ex
                if sx<0 then sx = 0
                if ex>dw-1 then ex=dw-1
                for x = sx to ex
                    dstptr[ (y * dw ) + x ] = col
                next
            end if
            lx += d1
            rx += d3
        next

        lx = x2
        for y = y2 to y3
            if y>-1 and y<dh then
                sx = lx
                ex = rx
                if sx>ex then swap sx,ex
                if sx<0 then sx = 0
                if ex>dw-1 then ex=dw-1
                for x = sx to ex
                    dstptr[ (y * dw ) + x ] = col
                next
            end if
            lx += d2
            rx += d3
        next

    else
        for y = y1 to y2 - 1
            if y>-1 and y<dh then
                sx = lx
                ex = rx
                if sx>ex then swap sx,ex
                if sx<0 then sx = 0
                if ex>dw-1 then ex=dw-1
                for x = sx to ex
                    *cast(ulong ptr, cast(ubyte ptr, dstptr) + y * dst->pitch + x * dst->bpp) = col
                next
            end if
            lx += d1
            rx += d3
        next

        lx = x2
        for y = y2 to y3
            if y>-1 and y<dh then
                sx = lx
                ex = rx
                if sx>ex then swap sx,ex
                if sx<0 then sx = 0
                if ex>dw-1 then ex=dw-1
                for x = sx to ex
                    *cast(ulong ptr, cast(ubyte ptr, dstptr) + y * dst->pitch + x * dst->bpp) = col
                next
            end if
            lx += d2
            rx += d3
        next

    end if

end sub

sub Triangle( byval dst as fb.Image ptr = 0, byref p1 as Vector2I, byref p2 as Vector2I, byref p3 as Vector2I, byval col as ulong = rgba(255,255,255,255) )

    Triangle( dst, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, col )

end sub


sub TriangleASM( byval dst as fb.Image ptr = 0, byval x1 as integer, byval y1 as integer, byval x2 as integer, byval y2 as integer, byval x3 as integer, byval y3 as integer, byval col as ulong = rgba(255,255,255,255) )

    dim as any ptr dstptr
    dim as integer dw, dh, dp

    if dst = 0 then
        dstptr = screenptr
        screeninfo dw,dh
        dp = dw * 4
    else
        dstptr = cast( ubyte ptr, dst ) + sizeOf( fb.Image )
        dw = dst->width
        dh = dst->height
        dp = dst->pitch
    end if

    if y2 < y1 then
        swap y1, y2
        swap x1, x2
    end if

    if y3 < y1 then
        swap y3, y1
        swap x3, x1
    end if

    if y3 < y2 then
        swap y3, y2
        swap x3, x2
    end if

    dim as single d1, d2, d3

    scope
        dim as integer dx1, dy1
        dx1 = x2 - x1
        dy1 = y2 - y1
        if dy1 <> 0 then
            d1 = dx1 / dy1
        else
            d1 = 0
        end if
    end scope

    scope
        dim as integer dx2, dy2
        dx2 = x3 - x2
        dy2 = y3 - y2
        if dy2 <> 0 then
            d2 = dx2 / dy2
        else
            d2 = 0
        end if
    end scope

    scope
        dim as integer dx3, dy3
        dx3 = x1 - x3
        dy3 = y1 - y3
        if dy3 <> 0 then
            d3 = dx3 / dy3
        else
            d3 = 0
        end if
    end scope

    dim as single lx, rx

    lx = x1
    rx = x1

    dim as single  lx_incr = any
    dim as single  rx_incr = any
    dim as integer y_start  = any
    dim as integer y_end    = any

    for t as integer = 0 to 1
        if t = 0 then
            lx_incr = d1
            rx_incr = d3
            y_start = y1
            y_end   = y2 - 1
        else
            lx_incr = d2
            rx_incr = d3
            y_start = y2
            y_end   = y3
            lx      = x2
        end if

        dim as any ptr __dstptr = dstptr + (y_start * dp)

        if y_end >= dh then y_end = dh - 1

        dim as integer y_draw_count = (y_end - y_start) + 1
        if y_draw_count > 0 then
            dim as integer y = any

            asm
                mov edx, dword ptr [y_draw_count]

                mov eax, dword ptr [y_start]
                mov dword ptr [y], eax

                fld dword ptr [lx_incr]
                fld dword ptr [rx_incr]
                fld dword ptr [lx]
                fld dword ptr [rx]

                y_inner:

                cmp dword ptr [y], -1
                jle no_x_draw
                sub esp, 4

                fld st(1)
                fistp dword ptr [esp]
                mov esi, dword ptr [esp]

                fist dword ptr [esp]
                mov edi, dword ptr [esp]

                add esp, 4
                cmp esi, edi
                jle no_swap

                mov eax, esi
                mov esi, edi
                mov edi, eax

                no_swap:

                cmp esi, 0
                jge no_clip_start_x

                mov esi, 0

                no_clip_start_x:

                mov eax, dword ptr [dw]
                cmp edi, eax
                jl no_clip_end_x

                dec eax
                mov edi, eax

                no_clip_end_x:

                mov ebx, esi
                shl ebx, 2
                add ebx, dword ptr [__dstptr]
                mov ecx, edi
                sub ecx, esi
                mov eax, dword ptr [col]
                inc ecx
                jle no_x_draw

                x_inner:

                mov dword ptr [ebx], eax
                add ebx, 4
                dec ecx
                jnz x_inner

                no_x_draw:

                fld st(3)
                faddp st(2), st(0)

                fadd st(2)

                mov eax, dword ptr [dp]
                add dword ptr [__dstptr], eax

                inc dword ptr [y]

                y_test:
                dec edx
                jnz y_inner

                fstp dword ptr [rx]
                fstp dword ptr [lx]

                finit

            end asm
        end if
    next t

end sub

sub TriangleASM( byval dst as fb.Image ptr = 0, byref p1 as Vector2I, byref p2 as Vector2I, byref p3 as Vector2I, byval col as ulong = rgba(255,255,255,255) )

    TriangleASM( dst, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, col )

end sub


'data for the model
MODEL_VERTEX_DATA:
data 56
data -0.5,-0.5,0.5
data -0.5,0.5,0.5
data 0.5,0.5,0.5
data 0.5,-0.5,0.5
data -0.5,-0.5,-0.5
data -0.5,0.5,-0.5
data 0.5,0.5,-0.5
data 0.5,-0.5,-0.5
data -0.3,-0.3,0.5
data -0.3,0.3,0.5
data 0.3,0.3,0.5
data 0.3,-0.3,0.5
data -0.5,-0.3,0.3
data -0.5,-0.3,-0.3
data -0.5,0.3,-0.3
data -0.5,0.3,0.3
data -0.3,0.5,0.3
data -0.3,0.5,-0.3
data 0.3,0.5,-0.3
data 0.3,0.5,0.3
data 0.5,-0.3,0.3
data 0.5,0.3,0.3
data 0.5,0.3,-0.3
data 0.5,-0.3,-0.3
data -0.3,-0.5,0.3
data 0.3,-0.5,0.3
data 0.3,-0.5,-0.3
data -0.3,-0.5,-0.3
data -0.3,-0.3,-0.5
data 0.3,-0.3,-0.5
data 0.3,0.3,-0.5
data -0.3,0.3,-0.5
data -0.1,-0.1,0.78
data -0.1,0.1,0.78
data 0.1,0.1,0.78
data 0.1,-0.1,0.78
data -0.78,-0.1,0.1
data -0.78,-0.1,-0.1
data -0.78,0.1,-0.1
data -0.78,0.1,0.1
data -0.1,0.78,0.1
data -0.1,0.78,-0.1
data 0.1,0.78,-0.1
data 0.1,0.78,0.1
data 0.78,-0.1,0.1
data 0.78,0.1,0.1
data 0.78,0.1,-0.1
data 0.78,-0.1,-0.1
data -0.1,-0.78,0.1
data 0.1,-0.78,0.1
data 0.1,-0.78,-0.1
data -0.1,-0.78,-0.1
data -0.1,-0.1,-0.78
data 0.1,-0.1,-0.78
data 0.1,0.1,-0.78
data -0.1,0.1,-0.78

MODEL_TRIANGLE_DATA: 
data 108
data 12,1,4
data 12,9,1
data 9,2,1
data 10,2,9
data 3,10,11
data 3,2,10
data 3,12,4
data 3,11,12
data 2,13,1
data 2,16,13
data 13,5,1
data 13,14,5
data 14,6,5
data 15,6,14
data 2,15,16
data 2,6,15
data 20,2,3
data 20,17,2
data 17,6,2
data 18,6,17
data 7,18,19
data 7,6,18
data 7,20,3
data 7,19,20
data 8,21,4
data 24,21,8
data 21,3,4
data 22,3,21
data 23,3,22
data 7,3,23
data 7,24,8
data 7,23,24
data 5,25,1
data 5,28,25
data 25,4,1
data 25,26,4
data 26,8,4
data 27,8,26
data 5,27,28
data 5,8,27
data 6,29,5
data 6,32,29
data 29,8,5
data 29,30,8
data 30,7,8
data 31,7,30
data 6,31,32
data 6,7,31
data 36,9,12
data 36,33,9
data 33,10,9
data 34,10,33
data 11,34,35
data 11,10,34
data 11,36,12
data 11,35,36
data 16,37,13
data 16,40,37
data 37,14,13
data 37,38,14
data 38,15,14
data 39,15,38
data 16,39,40
data 16,15,39
data 44,17,20
data 44,41,17
data 41,18,17
data 41,42,18
data 42,19,18
data 42,43,19
data 19,44,20
data 43,44,19
data 24,45,21
data 48,45,24
data 45,22,21
data 46,22,45
data 47,22,46
data 23,22,47
data 23,48,24
data 23,47,48
data 25,52,49
data 25,28,52
data 26,49,50
data 26,25,49
data 51,26,50
data 27,26,51
data 28,51,52
data 28,27,51
data 32,53,29
data 32,56,53
data 53,30,29
data 53,54,30
data 54,31,30
data 55,31,54
data 32,55,56
data 32,31,55
data 34,33,36
data 35,34,36
data 40,38,37
data 40,39,38
data 42,41,44
data 43,42,44
data 48,46,45
data 47,46,48
data 52,50,49
data 52,51,50
data 56,54,53
data 56,55,54

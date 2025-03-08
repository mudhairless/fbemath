#include once "fbemath/common.bi"
#include once "fbemath/vector3/vector3i.bi"

namespace math

''Class: Vector4I
''Simple 4 dimensional vector.
type Vector4I

    declare constructor ( byval x as integer, byval y as integer, byval z as integer, byval w as integer )
    declare constructor ( byref v4d as Vector4I )
    declare constructor ( )

   ''Variable: x
   x as integer

   ''Variable: y
   y as integer

   ''Variable: z
   z as integer

   ''Variable: w
   w as integer

   declare operator Cast() as string
   declare operator Cast() as Vector3I
   'declare operator *= ( byref rhs as matrix_ )


   ''Function: dot
   ''vector dot product function
   ''
   ''Parameters:
   ''v - second vector for dot product operation.
   ''
   ''Returns:
   ''integer precision dot product of vector "this"  and vector "v"
   ''
   declare function dot ( byref v As Vector4I ) as integer

   ''Function: magnitude
   ''vector magnitude function
   ''
   ''Returns:
   ''magnitude of "this" vector
   ''
   declare function magnitude() as integer

   ''Sub: normalize
   ''normalizes "this" vector
   ''
   declare sub normalize()

   ''Function: cross
   ''vector cross product function
   ''
   ''Parameters:
   ''v - second vector for cross product operation
   ''
   ''Returns:
   ''cross product of vector "this" and vector "v"
   ''
   declare function cross( byref v as Vector4I ) as Vector4I

   ''Function: distance
   ''vector distance function (euler)
   ''
   ''Parameters:
   ''v - second vector for distance operation
   ''
   ''Returns:
   ''the distance between vector "this" and vector "v"
   ''
   declare function distance ( byref v as Vector4I ) as integer

end type

declare operator + ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I
declare operator + ( byref lhs as Vector4I, byref rhs as integer ) as Vector4I
declare operator - ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I
declare operator * ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I
declare operator * ( Byref lhs As Vector4I, Byref rhs As integer ) As Vector4I
declare operator / ( Byref lhs As Vector4I, Byref rhs As integer ) As Vector4I
declare operator / ( byref lhs as Vector4I, byref rhs as Vector4I ) as Vector4I

end namespace
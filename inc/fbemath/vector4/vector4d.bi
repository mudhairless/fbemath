#include once "fbemath/common.bi"
#include once "fbemath/vector3/vector3d.bi"

namespace math

''Class: Vector4D
''Simple 4 dimensional vector.
type Vector4D

    declare constructor ( byval x as double, byval y as double, byval z as double, byval w as double )
    declare constructor ( byref v4d as Vector4D )
    declare constructor ( )

   ''Variable: x
   x as double

   ''Variable: y
   y as double

   ''Variable: z
   z as double

   ''Variable: w
   w as double

   declare operator Cast() as string
   declare operator Cast() as Vector3D
   'declare operator *= ( byref rhs as matrix_ )


   ''Function: dot
   ''vector dot product function
   ''
   ''Parameters:
   ''v - second vector for dot product operation.
   ''
   ''Returns:
   ''double precision dot product of vector "this"  and vector "v"
   ''
   declare function dot ( byref v As Vector4D ) as double

   ''Function: magnitude
   ''vector magnitude function
   ''
   ''Returns:
   ''magnitude of "this" vector
   ''
   declare function magnitude() as double

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
   declare function cross( byref v as Vector4D ) as Vector4D

   ''Function: distance
   ''vector distance function (euler)
   ''
   ''Parameters:
   ''v - second vector for distance operation
   ''
   ''Returns:
   ''the distance between vector "this" and vector "v"
   ''
   declare function distance ( byref v as Vector4D ) as double

end type

declare operator + ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D
declare operator + ( byref lhs as Vector4D, byref rhs as double ) as Vector4D
declare operator - ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D
declare operator * ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D
declare operator * ( Byref lhs As Vector4D, Byref rhs As double ) As Vector4D
declare operator / ( Byref lhs As Vector4D, Byref rhs As double ) As Vector4D
declare operator / ( byref lhs as Vector4D, byref rhs as Vector4D ) as Vector4D

end namespace
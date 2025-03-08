#include once "fbemath/common.bi"
#include once "fbemath/vector3/vector3s.bi"

namespace math

''Class: Vector4S
''Simple 4 dimensional vector.
type Vector4S

    declare constructor ( byval x as short, byval y as short, byval z as short, byval w as short )
    declare constructor ( byref v4d as Vector4S )
    declare constructor ( )

   ''Variable: x
   x as short

   ''Variable: y
   y as short

   ''Variable: z
   z as short

   ''Variable: w
   w as short

   declare operator Cast() as string
   declare operator Cast() as Vector3S
   'declare operator *= ( byref rhs as matrix_ )


   ''Function: dot
   ''vector dot product function
   ''
   ''Parameters:
   ''v - second vector for dot product operation.
   ''
   ''Returns:
   ''short precision dot product of vector "this"  and vector "v"
   ''
   declare function dot ( byref v As Vector4S ) as short

   ''Function: magnitude
   ''vector magnitude function
   ''
   ''Returns:
   ''magnitude of "this" vector
   ''
   declare function magnitude() as short

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
   declare function cross( byref v as Vector4S ) as Vector4S

   ''Function: distance
   ''vector distance function (euler)
   ''
   ''Parameters:
   ''v - second vector for distance operation
   ''
   ''Returns:
   ''the distance between vector "this" and vector "v"
   ''
   declare function distance ( byref v as Vector4S ) as short

end type

declare operator + ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S
declare operator + ( byref lhs as Vector4S, byref rhs as short ) as Vector4S
declare operator - ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S
declare operator * ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S
declare operator * ( Byref lhs As Vector4S, Byref rhs As short ) As Vector4S
declare operator / ( Byref lhs As Vector4S, Byref rhs As short ) As Vector4S
declare operator / ( byref lhs as Vector4S, byref rhs as Vector4S ) as Vector4S

end namespace
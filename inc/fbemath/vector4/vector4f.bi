#include once "fbemath/common.bi"
#include once "fbemath/vector3/vector3f.bi"

namespace math

''Class: Vector4F
''Simple 4 dimensional vector.
type Vector4F

    declare constructor ( byval x as single, byval y as single, byval z as single, byval w as single )
    declare constructor ( byref v4d as Vector4F )
    declare constructor ( )

   ''Variable: x
   x as single

   ''Variable: y
   y as single

   ''Variable: z
   z as single

   ''Variable: w
   w as single

   declare operator Cast() as string
   declare operator Cast() as Vector3F
   'declare operator *= ( byref rhs as matrix_ )


   ''Function: dot
   ''vector dot product function
   ''
   ''Parameters:
   ''v - second vector for dot product operation.
   ''
   ''Returns:
   ''single precision dot product of vector "this"  and vector "v"
   ''
   declare function dot ( byref v As Vector4F ) as single

   ''Function: magnitude
   ''vector magnitude function
   ''
   ''Returns:
   ''magnitude of "this" vector
   ''
   declare function magnitude() as single

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
   declare function cross( byref v as Vector4F ) as Vector4F

   ''Function: distance
   ''vector distance function (euler)
   ''
   ''Parameters:
   ''v - second vector for distance operation
   ''
   ''Returns:
   ''the distance between vector "this" and vector "v"
   ''
   declare function distance ( byref v as Vector4F ) as single

end type

declare operator + ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F
declare operator + ( byref lhs as Vector4F, byref rhs as single ) as Vector4F
declare operator - ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F
declare operator * ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F
declare operator * ( Byref lhs As Vector4F, Byref rhs As single ) As Vector4F
declare operator / ( Byref lhs As Vector4F, Byref rhs As single ) As Vector4F
declare operator / ( byref lhs as Vector4F, byref rhs as Vector4F ) as Vector4F

end namespace
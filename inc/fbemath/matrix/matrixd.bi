#include once "fbemath/common.bi"
#include once "fbemath/vector2/vector2d.bi"
#include once "fbemath/vector3/vector3d.bi"
#include once "fbemath/vector4/vector4d.bi"

namespace math

''Class: matrixD
''Standard OpenGL style (column major) matrix class for 3D programming.
''
''Usage:
''For simplicity, any reference to plane, will be Vector4D for this library.
''
type matrixD

    public:
    ''Sub: constructor
    ''Default constructor initializing the matrix to 0
    ''
    ''Parameters:
    ''c - optional value to initialize the matrix to, defaults to 0.
    ''
    declare constructor( byref c as double = 0)

    ''Sub: constructor
    ''Constructor used to set matrix values to a set of vectors.
    ''
    ''Parameters:
    ''r - the "right" vector.
    ''u - the "up" vector.
    ''f - the "forward" vector.
    ''p - the "position" vector.
    ''
    declare constructor( byref r as Vector3D, byref u as Vector3D, byref f as Vector3D, byref p as Vector3D )

    ''Sub: constructor
    ''Constructs a matrix from another.
    ''
    declare constructor( byref x as matrixD )

    ' TODO: remove this ? ...

    ''Sub: LoadIdentity
    ''"Resets" a transformation matrix with no rotation, translation, scaling or skewing.
    ''
    declare sub LoadIdentity()

    ' TODO: ... and keep this ?

    ''Function: Identity
    ''Returns the identity matrix, a matrix whose axis are normalized on
    ''the x, y and z axis, and whose position is at the origin (0, 0, 0).
    ''
    ''Returns:
    ''Returns the identity matrix.
    ''
    declare static function Identity ( ) as matrixD

    ''Sub: LookAt
    ''Simplifies the construction of camera systems commonly used in 3d games.
    ''
    ''Parameters:
    ''v1 - center of rotation: an example would be to send the player's position vector
    ''v2 - view vector: an example would be to send the player's forward vector
    ''vup - up vector: in a first person shooter, this would amost always be a <Vector3D>(0,1,0)
    ''
    declare sub LookAt( byref v1 as Vector3D, byref v2 as Vector3D, byref vup as Vector3D )

    ''Sub: PointAt
    ''Simplifies the creation of aligned matrices
    ''
    ''Parameters:
    ''v1 - center of rotation: an example would be to send the player's position vector
    ''v2 - arbitrary point in space to align the matrices forward vector with
    ''
    declare sub PointAt( byref v1 as Vector3D, byref v2 as Vector3D )


    ' TODO: remove this ? ...

    ''Function: Inverse
    ''This function is useful if you need the inverse matrix for calculating the local position of a vector, such as a light source.
    ''It's commonly used for such things as shadow volume projection and bump mapping in 3d scenes.
    ''This function is especially useful because the OpenGL API does not provide an inverse matrix function.
    ''
    ''Returns:
    ''The inverse of the matrix.
    ''
    declare function Inverse() as matrixD

    ' TODO: ... and keep these ?

    ''Function: Invert
    ''Inverts the matrix. The new matrix value, when multiplied by it's
    ''previous value, results in the identity matrix.
    ''
    ''Description:
    ''This function is useful if you need the inverse matrix for calculating the local position of a vector, such as a light source.
    ''It's commonly used for such things as shadow volume projection and bump mapping in 3d scenes.
    ''This function is especially useful because the OpenGL API does not provide an inverse matrix function.
    ''
    declare sub Invert()

    ''Function: Invert_copy
    ''Returns the inverse of the matrix.
    ''
    ''Returns:
    ''Returns the inverse of the matrix.
    ''
    declare function Invert_copy() as matrixD

    ''Function: PlanarProjection
    ''Builds a planar projection matrix using Vector4D and plane(Vector4D).
    ''For simplicity, this library has no "plane" type, it uses Vector4D.
    ''
    ''Parameters:
    ''lightpos - position of light source(Vector4D)
    ''plane - plane to project onto.
    ''
    ''Returns:
    ''the new planar projection matrix
    ''
    declare function PlanarProjection( byref lightpos as Vector4D, byref plane as Vector4D ) as matrixD


    ''Sub: InfiniteProjection
    ''Builds an infinite projection matrix using fov(field of view), aspectratio( aspect ratio ) and znear( znear )
    ''
    ''Parameters:
    ''fov field of view... in opengl, use the same value you would bnormally build your projection matrix with
    ''aspectratio... again, in opengl, use the same value you would normally build your projection matrix with
    ''znear... and again, in opengl, use the same value you would normally build your projection matrix with
    ''
    ''Returns:
    ''nothing
    ''
    declare sub InfiniteProjection( byref fov as double, byref aspectratio as double, byref znear as double )

    ''Sub: AxisAngle
    ''
    declare sub AxisAngle( byref v as Vector3D, byref angle as double )

    ''Sub: Translate
    ''generic translation function
    ''
    ''Parameters:
    ''X - translate to x position
    ''Y - translate to y position
    ''Z - translate to z position
    ''
    declare sub Translate( byref x as double, byref y as double, byref z as double )


    ''Sub: Rotate
    ''generic rotation function
    ''
    ''Parameters:
    ''anglex - angle to rotate about the x axis
    ''angley - angle to rotate about the y axis
    ''anglez - angle to rotate about the z axis
    ''
    declare sub Rotate( byref anglex as double, byref angley as double, byref anglez as double )

    ''Sub: Scale
    ''Scales each axis of the matrix by scalar
    ''
    ''Parameters:
    ''scalar - amount to scale by.
    ''
    declare sub Scale( byref scalar as double )

    ''Sub: Scale
    ''Scales each axis of the matrix independently
    ''
    ''Parameters:
    ''scalarx - amount to scale the x axis by.
    ''scalary - amount to scale the y axis by.
    ''scalarz - amount to scale the z axis by.
    ''
    declare sub Scale( byref scalarx as double, byref scalary as double, byref scalarz as double )

    ''Sub: Gram_Scmidt
    ''Calculates an orthonormal matrix with the forward vector aligned with vector "d", while "vectors "up" and "right" are calculated using the "Gram Schmidt" method.
    ''
    ''Parameters:
    ''d - the vector to use for forward
    ''
    declare sub Gram_Schmidt( byref d as Vector3D )

    'setters
    ''Property: Right
    ''setter for the right vector component
    ''
    ''Parameters:
    ''v - sets the right vector components of the matrix
    ''
    declare property Right( byref v as Vector3D )

    ''Property: Up
    ''setter for the up vector component
    ''
    ''Parameters:
    ''v - sets the up vector components of the matrix
    ''
    declare property Up( byref v as Vector3D )

    ''Property: Forward
    ''setter for the forward vector component
    ''
    ''Parameters:
    ''v - sets the forward vector components of the matrix
    ''
    declare property Forward( byref v as Vector3D )

    ''Property: Position
    ''setter for the position vector component
    ''
    ''Parameters:
    ''v - sets the position vector components of the matrix
    ''
    declare property Position( byref v as Vector3D )


    'getters
    ''Property: Right
    ''getter for the right vector component
    ''
    ''Returns:
    ''the right vector components of the matrix
    ''
    declare property Right() as Vector3D

    ''Property: Up
    ''getter for the up vector component
    ''
    ''Returns:
    ''the up vector components of the matrix
    ''
    declare property Up() as Vector3D

    ''Property: Forward
    ''getter for the forward vector component
    ''
    ''Returns:
    ''the forward vector components of the matrix
    ''
    declare property Forward() as Vector3D

    ''Property: Position
    ''getter for the position vector component
    ''
    ''Returns:
    ''the position vector components of the matrix
    ''
    declare property Position() as Vector3D

    ''Property: GetArrayData
    ''Returns a pointer to the matrix data for passing to OpenGL functions.
    ''
    declare property GetArrayData() as double ptr

    'operators
    declare operator *= ( byref mat as matrixD )
    declare operator cast() as string
    declare operator cast() as double ptr

    private:
    m(16) as double = any

end type

'global operators
declare operator * ( byref lhs as matrixD, byref rhs as matrixD ) as matrixD
declare operator * ( byref lhs as Vector2D, byref rhs as matrixD ) as Vector2D
declare operator * ( byref lhs as Vector3D, byref rhs as matrixD ) as Vector3D
declare operator * ( byref lhs as Vector4D, byref rhs as matrixD ) as Vector4D

end namespace
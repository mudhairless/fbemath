# include once "fbemath/vector3/vector3f.bi"
# include once "fbemath/vector4/vector4f.bi"

dim as math.Vector4F my4
dim as math.Vector3F my3


my4.x = 1
my4.y = 2
my4.z = 3
my4.w = 23

print my4

my4 = my4 + my4

print my4

my3 = my4
print my3

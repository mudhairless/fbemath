#include once "fbemath/common.bi"

namespace math

''Function: RndRange
''Returns an integer within the specified range.
''
''Parameters:
''min_ - the minimum number to return.
''max - the maximum number to return.
''getnew - optional parameter to pass to rnd, defaults to 1.
''
''Returns:
''Random integer between min_ and max.
''
declare function RndRange overload (byval min_ as integer, byval max as integer, byval getnew as integer = 1) as integer

''Function: RndRange
''Returns an double within the specified range.
''
''Parameters:
''min_ - the minimum number to return.
''max - the maximum number to return.
''getnew - optional parameter to pass to rnd, defaults to 1.
''
''Returns:
''Random double between min_ and max.
''
declare function RndRange overload (byval lower as double, byval upper as double, byval getnew as integer = 1) as double

end namespace
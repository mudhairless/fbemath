#include once "fbemath/common.bi"

namespace math
'' Function: nCr
'' Finds the number of combinations of a sub-set of elements of a set.
''
'' Parameters:
'' n - the total number of elements in the set.
'' r - the number of elements in the sub-set.
''
'' Returns:
'' The number of combinations of size //r// possible from a set of
'' size //n//.
declare function nCr (byval n as ulongint, byval r as ulongint) as ulongint

end namespace
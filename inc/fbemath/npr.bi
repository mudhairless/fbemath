#include once "fbemath/common.bi"

namespace math
'' Function: nPr
'' Finds the number of permutations of a sub-set of elements of a set.
''
'' Parameters:
'' n - the total number of elements in the set.
'' r - the number of elements in the sub-set.
''
'' Returns:
'' The number of permutations of size //r// possible from a set of
'' size //n//.
declare function nPr (byval n as ulongint, byval r as ulongint) as ulongint

end namespace
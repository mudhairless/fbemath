#include once "fbemath/common.bi"

namespace math
''Function: factorial
''Computes a factorial number up to <MAX_FACTORIAL>
''
''Parameters:
''n - the number to calculate the factorial of.
''
''Returns:
''The factorial of n.
''
declare function factorial (byval n as double) as double

''Constant: MAX_FACTORIAL
const MAX_FACTORIAL = 256#

end namespace
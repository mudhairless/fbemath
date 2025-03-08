#include once "fbemath/common.bi"

namespace math

''Function: NextPow2
''Finds the next power of 2 after a number.
''
''Overloaded to work with all numeric types.
''
''Parameters:
''ds - the number to find the next power of 2 after.
''
''Returns:
''The next power of 2.
''
declare function NextPow2 overload ( byval ds as double ) as double
declare function NextPow2 overload ( byval ds as single ) as single
declare function NextPow2 overload ( byval ds as integer ) as integer
declare function NextPow2 overload ( byval ds as short ) as short

''Function: RoundPow2
''Finds the next power of 2 after a number only if the number passed is not a power of 2 already.
''
''Overloaded to work with all numeric types.
''
''Parameters:
''ds - the number to find the next power of 2 after.
''
''Returns:
''The next power of 2 if ds is not a power of 2, ds otherwise.
''
declare function RoundPow2 overload ( byval n as double ) as double
declare function RoundPow2 overload ( byval n as single ) as single
declare function RoundPow2 overload ( byval n as integer ) as integer
declare function RoundPow2 overload ( byval n as short ) as short

''Function: IsPow2
''Determines if the number passed is a power of 2.
''
''Overloaded to work with all numeric types.
''
''Parameters:
''xx - the number to check.
''
''Returns:
''True if the number is a power of two.
''
declare function IsPow2 overload ( byval n as double ) as boolean
declare function IsPow2 overload ( byval n as single ) as boolean
declare function IsPow2 overload ( byval n as integer ) as boolean
declare function IsPow2 overload ( byval n as short ) as boolean

end namespace
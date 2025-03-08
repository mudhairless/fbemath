#include once "fbemath/random.bi"

namespace math

function RndRange (byval min_ as integer, byval max as integer, byval getnew as integer = 1) as integer

	dim as integer temp = min_ -1

	do while temp < min_ or temp > max
		temp = int(rnd(getnew)*max)+1
	loop

	return temp

end function

function RndRange (byval lower as double, byval upper as double, byval getnew as integer = 1) as double
	return rnd(getnew) * (upper - lower + 1) + lower
end function

end namespace
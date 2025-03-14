namespace math
'' Constant: FBE_EPSILON
''
const epsilon = 0.0000000001d

'mathematical constants taken from here: http://www.ibiblio.org/pub/docs/books/gutenberg/etext96/miscc10.txt
'' Constant: pi
const pi as double = 3.1415926535897932
'' Constant: inv_pi
const inv_pi as double = 1 / pi
'' Constant: pi2
const pi2 as double = pi * 2
'' Constant: pi_2
const pi_2 as double = pi / 2
'' Constant: pi_180
const pi_180 as double = pi / 180.0
'' Constant: inv_pi_180
const inv_pi_180 as double = 1 / pi_180
'' Constant: inv_sqr_2pi
const inv_sqr_2pi as double = 0.39894228040143267
'' Constant: three_div_pi2
const three_div_pi2 as double = 0.303963550927013
'' Constant: euler
const euler as double = 0.333177923807718674318
'' Constant: arctan_1div2
'' The arc-tangent of 1 / 2
const arctan_1div2 as double = 0.4636476090008061
'' Constant: berstein
const berstein as double = 0.2801694990238691330364
'' Constant: cos1
'' cosine(1)
const cos1 as double = 0.5403023058681397174
'' Constant: cube_root_3
const cube_root_3 as double = 1.442249570307408382321
'' Constant: inv_log2
'' 1 / log(2)
const inv_log2 as double = 1.442695040888963
'' Constant: e
const e as double = 2.718281828459045
'' Constant: Y
const Y as double = 0.577215664901532
'' Constant: feigenbaum_reduction
const feigenbaum_reduction as double = 2.50290787509589282228
'' Constant: feigenbaum_bifurcation
const feigenbaum_bifurcation as double = 4.66920160910299067185
'' Constant: fransen_robinson
const fransen_robinson as double = 2.8077702420285
'' Constant: gamma
const gamma as double = 0.577215664901532860606
'' Constant: gauss_kuzmin_wirsing
const gauss_kuzmin_wirsing as double = 0.303663002898732
'' Constant: golomb
const golomb as double = 0.6243299885435508
'' Constant: khinchin
const khinchin as double = 2.685452001065306
'' Constant: lehmer
const lehmer as double = .5926327182016361971040

end namespace

''Macro: FBE_ANGLE_TO_RADIAN
''Converts an Angle to Radians.
#define FBE_ANGLE_TO_RADIAN(x) (x) * pi_180

''Macro: FBE_RADIAN_TO_ANGLE
''Converts a Radian to an Angle.
#define FBE_RADIAN_TO_ANGLE(x) (x) * inv_pi_180

# define FBE_DEGREE_TO_RADIAN(n) ((n) * math.pi_180)
# define FBE_RADIAN_TO_DEGREE(n) ((n) * math.inv_pi_180)

'' Macro: FBE_FLOAT_EQUAL
'' Compares two floating-point values for equality.
''
# define FBE_FLOAT_EQUAL(a, b) (abs((a) - (b)) < math.epsilon)

'' Macro: FBE_FLOAT_NOTEQUAL
'' Compares two floating-point values for inequality.
''
# define FBE_FLOAT_NOTEQUAL(a, b) (not FBE_FLOAT_EQUAL(a, b))

#inclib "fbemath"
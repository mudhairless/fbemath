@IF "%fbc%"=="" (
    @echo Please run SET FBC=fbc32 or your preferred compiler first
    @goto :eof
)
@echo Clearing Old Build Files
@del src\*.o
@del lib\*.a
@del tests\*.exe
@del examples\*.exe

@echo Building Components
%fbc% -c -i inc -w all -O 2 src/factorial.bas
%fbc% -c -i inc -w all -O 2 src/intersectsd.bas
%fbc% -c -i inc -w all -O 2 src/intersectsf.bas
%fbc% -c -i inc -w all -O 2 src/intersectsi.bas
%fbc% -c -i inc -w all -O 2 src/intersectss.bas
%fbc% -c -i inc -w all -O 2 src/line2d.bas
%fbc% -c -i inc -w all -O 2 src/line2f.bas
%fbc% -c -i inc -w all -O 2 src/line2i.bas
%fbc% -c -i inc -w all -O 2 src/line2s.bas
%fbc% -c -i inc -w all -O 2 src/matrixd.bas
%fbc% -c -i inc -w all -O 2 src/matrixf.bas
%fbc% -c -i inc -w all -O 2 src/matrixi.bas
%fbc% -c -i inc -w all -O 2 src/matrixs.bas
%fbc% -c -i inc -w all -O 2 src/ncr.bas
%fbc% -c -i inc -w all -O 2 src/npr.bas
%fbc% -c -i inc -w all -O 2 src/pow2.bas
%fbc% -c -i inc -w all -O 2 src/projections.bas
%fbc% -c -i inc -w all -O 2 src/random.bas
%fbc% -c -i inc -w all -O 2 src/reflections.bas
%fbc% -c -i inc -w all -O 2 src/vector2d.bas
%fbc% -c -i inc -w all -O 2 src/vector2f.bas
%fbc% -c -i inc -w all -O 2 src/vector2i.bas
%fbc% -c -i inc -w all -O 2 src/vector2s.bas
%fbc% -c -i inc -w all -O 2 src/vector3d.bas
%fbc% -c -i inc -w all -O 2 src/vector3f.bas
%fbc% -c -i inc -w all -O 2 src/vector3i.bas
%fbc% -c -i inc -w all -O 2 src/vector3s.bas
%fbc% -c -i inc -w all -O 2 src/vector4d.bas
%fbc% -c -i inc -w all -O 2 src/vector4f.bas
%fbc% -c -i inc -w all -O 2 src/vector4i.bas
%fbc% -c -i inc -w all -O 2 src/vector4s.bas

@echo Building Libraries
%fbc% -lib src/factorial.o src/intersectsd.o src/intersectsf.o src/intersectsi.o src/intersectss.o src/line2d.o src/line2f.o src/line2i.o src/line2s.o src/matrixd.o src/matrixf.o src/matrixi.o src/matrixs.o src/ncr.o src/npr.o src/pow2.o src/projections.o src/random.o src/reflections.o src/vector2d.o src/vector3d.o src/vector4d.o src/vector2f.o src/vector3f.o src/vector4f.o src/vector2i.o src/vector3i.o src/vector4i.o src/vector2s.o src/vector3s.o src/vector4s.o -x lib/libfbemath.a

@echo Running Tests
%fbc% -i inc -p lib -w all -O 2 tests/matrix.bas
@tests\matrix.exe
%fbc% -i inc -p lib -w all -O 2 tests/npr-ncr.bas
@tests\npr-ncr.exe
%fbc% -i inc -p lib -w all -O 2 tests/pow2.bas
@tests\pow2.exe
%fbc% -i inc -p lib -w all -O 2 tests/random.bas
@tests\random.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector2-angle.bas
@tests\vector2-angle.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector2-distance.bas
@tests\vector2-distance.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector2-dot.bas
@tests\vector2-dot.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector2-magnitude.bas
@tests\vector2-magnitude.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector2-normal.bas
@tests\vector2-normal.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector2-normalize.bas
@tests\vector2-normalize.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector3-distance.bas
@tests\vector3-distance.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector3-dot.bas
@tests\vector3-dot.exe
%fbc% -i inc -p lib -w all -O 2 tests/vector3-magnitude.bas
@tests\vector3-magnitude.exe

@echo Building Examples
%fbc% -i inc -p lib -w all -O 2 examples/2drotate.bas
%fbc% -i inc -p lib -w all -O 2 examples/3drotate.bas
%fbc% -i inc -p lib -w all -O 2 examples/line-intersect.bas
%fbc% -i inc -p lib -w all -O 2 examples/perm-comb.bas
%fbc% -i inc -p lib -w all -O 2 examples/perpendicular-lines.bas
%fbc% -i inc -p lib -w all -O 2 examples/PointAt.bas
%fbc% -i inc -p lib -w all -O 2 examples/sphere-line-collision.bas
%fbc% -i inc -p lib -w all -O 2 examples/stars.bas
%fbc% -i inc -p lib -w all -O 2 examples/vector-field.bas
%fbc% -i inc -p lib -w all -O 2 examples/vectors.bas
%fbc% -i inc -p lib -w all -O 2 examples/yinyang.bas


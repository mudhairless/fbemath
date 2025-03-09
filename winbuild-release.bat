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
%fbc% -c -i inc -w all -exx src/factorial.bas
%fbc% -c -i inc -w all -exx src/intersectsd.bas
%fbc% -c -i inc -w all -exx src/intersectsf.bas
%fbc% -c -i inc -w all -exx src/intersectsi.bas
%fbc% -c -i inc -w all -exx src/intersectss.bas
%fbc% -c -i inc -w all -exx src/line2d.bas
%fbc% -c -i inc -w all -exx src/line2f.bas
%fbc% -c -i inc -w all -exx src/line2i.bas
%fbc% -c -i inc -w all -exx src/line2s.bas
%fbc% -c -i inc -w all -exx src/matrixd.bas
%fbc% -c -i inc -w all -exx src/matrixf.bas
%fbc% -c -i inc -w all -exx src/matrixi.bas
%fbc% -c -i inc -w all -exx src/matrixs.bas
%fbc% -c -i inc -w all -exx src/ncr.bas
%fbc% -c -i inc -w all -exx src/npr.bas
%fbc% -c -i inc -w all -exx src/pow2.bas
%fbc% -c -i inc -w all -exx src/projections.bas
%fbc% -c -i inc -w all -exx src/random.bas
%fbc% -c -i inc -w all -exx src/reflections.bas
%fbc% -c -i inc -w all -exx src/vector2d.bas
%fbc% -c -i inc -w all -exx src/vector2f.bas
%fbc% -c -i inc -w all -exx src/vector2i.bas
%fbc% -c -i inc -w all -exx src/vector2s.bas
%fbc% -c -i inc -w all -exx src/vector3d.bas
%fbc% -c -i inc -w all -exx src/vector3f.bas
%fbc% -c -i inc -w all -exx src/vector3i.bas
%fbc% -c -i inc -w all -exx src/vector3s.bas
%fbc% -c -i inc -w all -exx src/vector4d.bas
%fbc% -c -i inc -w all -exx src/vector4f.bas
%fbc% -c -i inc -w all -exx src/vector4i.bas
%fbc% -c -i inc -w all -exx src/vector4s.bas

@echo Building Libraries
%fbc% -lib src/factorial.o src/intersectsd.o src/intersectsf.o src/intersectsi.o src/intersectss.o src/line2d.o src/line2f.o src/line2i.o src/line2s.o src/matrixd.o src/matrixf.o src/matrixi.o src/matrixs.o src/ncr.o src/npr.o src/pow2.o src/projections.o src/random.o src/reflections.o src/vector2d.o src/vector3d.o src/vector4d.o src/vector2f.o src/vector3f.o src/vector4f.o src/vector2i.o src/vector3i.o src/vector4i.o src/vector2s.o src/vector3s.o src/vector4s.o -x lib/libfbemath.a

@echo Running Tests
%fbc% -i inc -p lib -w all -exx tests/matrix.bas
@tests\matrix.exe
%fbc% -i inc -p lib -w all -exx tests/npr-ncr.bas
@tests\npr-ncr.exe
%fbc% -i inc -p lib -w all -exx tests/pow2.bas
@tests\pow2.exe
%fbc% -i inc -p lib -w all -exx tests/random.bas
@tests\random.exe
%fbc% -i inc -p lib -w all -exx tests/vector2-angle.bas
@tests\vector2-angle.exe
%fbc% -i inc -p lib -w all -exx tests/vector2-distance.bas
@tests\vector2-distance.exe
%fbc% -i inc -p lib -w all -exx tests/vector2-dot.bas
@tests\vector2-dot.exe
%fbc% -i inc -p lib -w all -exx tests/vector2-magnitude.bas
@tests\vector2-magnitude.exe
%fbc% -i inc -p lib -w all -exx tests/vector2-normal.bas
@tests\vector2-normal.exe
%fbc% -i inc -p lib -w all -exx tests/vector2-normalize.bas
@tests\vector2-normalize.exe
%fbc% -i inc -p lib -w all -exx tests/vector3-distance.bas
@tests\vector3-distance.exe
%fbc% -i inc -p lib -w all -exx tests/vector3-dot.bas
@tests\vector3-dot.exe
%fbc% -i inc -p lib -w all -exx tests/vector3-magnitude.bas
@tests\vector3-magnitude.exe

@echo Building Examples
%fbc% -i inc -p lib -w all -exx examples/2drotate.bas
%fbc% -i inc -p lib -w all -exx examples/3drotate.bas
%fbc% -i inc -p lib -w all -exx examples/line-intersect.bas
%fbc% -i inc -p lib -w all -exx examples/perm-comb.bas
%fbc% -i inc -p lib -w all -exx examples/perpendicular-lines.bas
%fbc% -i inc -p lib -w all -exx examples/PointAt.bas
%fbc% -i inc -p lib -w all -exx examples/sphere-line-collision.bas
%fbc% -i inc -p lib -w all -exx examples/stars.bas
%fbc% -i inc -p lib -w all -exx examples/vector-field.bas
%fbc% -i inc -p lib -w all -exx examples/vectors.bas
%fbc% -i inc -p lib -w all -exx examples/yinyang.bas


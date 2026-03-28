@echo on
setlocal EnableDelayedExpansion

:: Configure using the CMakeFiles
cmake -S %SRC_DIR% -B build -G "Ninja" ^
      -DBUILD_SHARED_LIBS=ON ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      %CMAKE_ARGS%
if errorlevel 1 exit 1

:: Build!
cmake --build build -j %CPU_COUNT%
if errorlevel 1 exit 1

:: Install!
cmake --install build
if errorlevel 1 exit 1

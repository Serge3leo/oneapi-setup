#!
# vim:set sw=4 ts=8 et fileencoding=utf8:
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)

set -e

c_compiler=icx
cpp_compiler=icpx
build_type=Release
build_output_dir=build/`uname -s`_icx

cmake -B "$build_output_dir" \
        -DCMAKE_C_COMPILER=$c_compiler \
        -DCMAKE_CXX_COMPILER=$cpp_compiler \
        -DCMAKE_BUILD_TYPE=$build_type \
        -G "Unix Makefiles" \
        -S .
cmake --build "$build_output_dir" --config $build_type
cmake -E chdir "$build_output_dir" ctest --build-config $build_type
cmake -E chdir "$build_output_dir" ./hello
cmake -E chdir "$build_output_dir" ./hello++

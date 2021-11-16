#!/bin/bash
set -e && cd "${0%/*}"

python3 bisect_test_generator_v3.py
dart format ../generated/*.dart
echo "done!"
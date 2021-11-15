#!/bin/bash
set -e && cd "${0%/*}"

# the first test generator did not generate the whole files.
# It creates only fragments of code to be copy-pasted. So we automate only
# the second one. This is not a big problem, since the first generator
# essentially makes test for deprecated functions.

FILE='../generated/generated_v3_test.dart'
python3 bisect_test_generator_v3.py > $FILE
dart format $FILE
echo "done!"
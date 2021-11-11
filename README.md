![Generic badge](https://img.shields.io/badge/status-it_works-ok.svg)
[![Pub Package](https://img.shields.io/pub/v/bisection.svg)](https://pub.dev/packages/bisection)
[![pub points](https://badges.bar/bisection/pub%20points)](https://pub.dev/packages/bisection/score)
![Generic badge](https://img.shields.io/badge/testing_on-Windows_|_Linux-blue.svg)
![Generic badge](https://img.shields.io/badge/testing_on-VM_|_JS-blue.svg)

# [bisection](https://github.com/rtmigo/bisection_dart)

Library for searching in sorted lists and adding items to sorted lists while
maintaining the order of the items.

Port of the Python [bisect](https://docs.python.org/3/library/bisect.html)
library to the Dart language. The `bisectLeft` and `bisectRight` functions of
this library return exactly the same results as `bisect_left`, `bisect_right` in
Python.

Python         | Dart
---------------|-------
`bisect`       | `bisectRight`
`bisect_left`  | `bisectLeft`
`bisect_right` | `bisectRight`
`insort`       | `insortRight`
`insort_left`  | `insortLeft`
`insort_right` | `insortRight`


## Basic example

```dart
import 'package:bisection/bisection.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'E'];

  // Find the index of an item in a sorted list
  print(list.bisectLeft('B')); // 1

  // find the future index for a non-existent item
  print(list.bisectLeft('D')); // 3

  // add an item to the list while keeping the list sorted
  list.insortLeft('D');
  print(list); // [A, B, C, D, E]
}
```

## Searching in sorted lists

In addition to the basic functions of the `bisect` library,
[search functions](https://docs.python.org/3/library/bisect.html#searching-sorted-lists)
such as `index`, `find_lt`, `find_le`, `find_gt`, `find_ge` are also
implemented.

```dart
import 'package:bisection/bisection.dart';

void main() {
  // the list must be sorted
  var list = ['A', 'B', 'C', 'D', 'E'];

  // index of leftmost value exactly equal to 'C'
  print(list.bsearch('C')); // 2


  // index of rightmost item less than or equal to 'C'
  print(list.bsearchLessThanOrEqualTo('C')); // 2

  // index of rightmost item less than 'C'
  print(list.bsearchLessThan('C')); // 1

  // index if leftmost item greater than or equal to 'C'
  print(list.bsearchGreaterThanOrEqualTo('C')); // 2

  // index of leftmost greater than 'C'
  print(list.bsearchGreaterThan('C')); // 3
}

```

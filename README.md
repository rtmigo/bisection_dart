# [bisection](https://github.com/rtmigo/bisection_dart)

Library for searching in sorted lists and adding elements to sorted lists while
maintaining the order of the elements.

Port of the Python [bisect](https://docs.python.org/3/library/bisect.html) with
[search functions](https://docs.python.org/3/library/bisect.html#searching-sorted-lists).

## Use bisect functions

```dart
import 'package:bisection/bisect.dart';

void main() {
  // The list must be sorted
  final arr = ['A', 'B', 'C', 'E'];

  // Find the index of an item in a sorted list
  print(bisect(arr, 'B'));  // 2

  // Find the future index for a non-existent item
  print(bisect_left(arr, 'D'));  // 3

  // Add an item to the list while keeping the list sorted
  insort(arr, 'D');
  print(arr);  // [A, B, C, D, E]

  // Find leftmost value greater than 'B'
  print(find_gt(arr, 'B'));  // C
}
```

## Use list extensions

```dart
import 'package:bisection/extension.dart';

void main() {
  // The list must be sorted
  final arr = ['A', 'B', 'C', 'E'];

  // Find the index of an item in a sorted list
  print(arr.bisectRight('B'));  // 2

  // Find the future index for a non-existent item
  print(arr.bisectLeft('D'));  // 3

  // Add an item to the list while keeping the list sorted
  arr.insortLeft('D');
  print(arr);  // [A, B, C, D, E]

  // Locate leftmost value greater than 'B'
  print(arr.bsearchGreaterThan('B'));  // 2
}
```

Python `bisect` docs   | Dart `bisection` extension methods
-----------------------|--------------------------------------
`bisect(arr, x)`       | `arr.bisectRight(x)`
`bisect_left(arr, x)`  | `arr.bisectLeft(x)`
`bisect_right(arr, x)` | `arr.bisectRight(x)`
`insort(arr, x)`       | `arr.insortRight(x)`
`insort_left(arr, x)`  | `arr.insortLeft(x)`
`insort_right(arr, x)` | `arr.insortRight(x)`
`index(arr, x)`        | `arr[arr.bsearch(x)]]`
`find_lt(arr, x)`      | `arr[arr.bsearchLessThan(x)]`
`find_le(arr, x)`      | `arr[arr.bsearchLessThanOrEqualTo(x)]`
`find_gt(arr, x)`      | `arr[arr.bsearchGreaterThan(x)]`
`find_ge(arr, x)`      | `arr[arr.bsearchGreaterThanOrEqualTo(x)]`





Python `bisect`         | Dart `bisection`
------------------------|--------------------------------------

## Basic example

```dart
import 'package:bisection/bisection.dart';

void main() {
  // The list must be sorted
  var arr = ['A', 'B', 'C', 'E'];

  // Find the index of an element in a sorted arr
  print(arr.bisectLeft('B')); // 1

  // find the future index for a non-existent element
  print(arr.bisectLeft('D')); // 3

  // add an element to the arr while keeping the arr sorted
  arr.insortLeft('D');
  print(arr); // [A, B, C, D, E]
}
```

## Searching in sorted lists

In addition to the basic functions of the `bisect` library,
[search functions](https://docs.python.org/3/library/bisect.html#searching-sorted-lists)
are also implemented.

In both Dart and Python, these functions find the same elements. However, in
`bisection`, the indexes of the elements are returned, not their values. This
gives a more flexibility.


```dart
import 'package:bisection/bisection.dart';

void main() {
  // the arr must be sorted
  var arr = ['A', 'B', 'C', 'D', 'E'];

  // index of leftmost value exactly equal to 'C'
  print(arr.bsearch('C')); // 2


  // index of rightmost element less than or equal to 'C'
  print(arr.bsearchLessThanOrEqualTo('C')); // 2

  // index of rightmost element less than 'C'
  print(arr.bsearchLessThan('C')); // 1

  // index if leftmost element greater than or equal to 'C'
  print(arr.bsearchGreaterThanOrEqualTo('C')); // 2

  // index of leftmost greater than 'C'
  print(arr.bsearchGreaterThan('C')); // 3
}
```

## Differences from Python bisect

The consistency of the results in Python and Dart was verified
by [Dart unit tests](https://github.com/rtmigo/bisection_dart/blob/staging/test/generated_v2_test.dart)
, generated
by [Python scripts](https://github.com/rtmigo/bisection_dart/blob/staging/test/generators/bisect_test_generator_v2.py)
.


The `bisect_left` and `bisect_right` in Python allows you to set strange
arguments. For example, `lo` may be far beyond the right boundary of the array,
and `hi` may be negative.

This Dart implementation does not allow negative `hi` values. An exception will be
thrown when trying to pass such a value.
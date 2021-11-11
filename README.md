# [bisection](https://github.com/rtmigo/bisection_dart)

Library for searching in sorted lists and adding elements to sorted lists while
maintaining the order of the elements.

Port of the Python [bisect](https://docs.python.org/3/library/bisect.html)
library to the Dart language. Extension methods of this library return exactly
the same results as the Python functions.


Python `bisect`         | Dart `bisection`
------------------------|--------------------------------------
`bisect(list, x)`       | `list.bisectRight(x)`
`bisect_left(list, x)`  | `list.bisectLeft(x)`
`bisect_right(list, x)` | `list.bisectRight(x)`
`insort(list, x)`       | `list.insortRight(x)`
`insort_left(list, x)`  | `list.insortLeft(x)`
`insort_right(list, x)` | `list.insortRight(x)`

## Basic example

```dart
import 'package:bisection/bisection.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'E'];

  // Find the index of an element in a sorted list
  print(list.bisectLeft('B')); // 1

  // find the future index for a non-existent element
  print(list.bisectLeft('D')); // 3

  // add an element to the list while keeping the list sorted
  list.insortLeft('D');
  print(list); // [A, B, C, D, E]
}
```

## Searching in sorted lists

In addition to the basic functions of the `bisect` library,
[search functions](https://docs.python.org/3/library/bisect.html#searching-sorted-lists)
are also implemented.

They find the same elements, but return the indexes of the elements instead of
their values.

Python `bisect` docs    | Dart `bisection`
------------------------|--------------------------------------
`index(list, x)`        | ```dart list[list.bsearch(x)]]```
`find_lt(list, x)`      | `list[list.bsearchLessThan(x)]`
`find_le(list, x)`      | `list[list.bsearchLessThanOrEqualTo(x)]`
`find_gt(list, x)`      | `list[list.bsearchGreaterThan(x)]`
`find_ge(list, x)`      | `list[list.bsearchGreaterThanOrEqualTo(x)]`

```dart
import 'package:bisection/bisection.dart';

void main() {
  // the list must be sorted
  var list = ['A', 'B', 'C', 'D', 'E'];

  // index of leftmost value exactly equal to 'C'
  print(list.bsearch('C')); // 2


  // index of rightmost element less than or equal to 'C'
  print(list.bsearchLessThanOrEqualTo('C')); // 2

  // index of rightmost element less than 'C'
  print(list.bsearchLessThan('C')); // 1

  // index if leftmost element greater than or equal to 'C'
  print(list.bsearchGreaterThanOrEqualTo('C')); // 2

  // index of leftmost greater than 'C'
  print(list.bsearchGreaterThan('C')); // 3
}
```

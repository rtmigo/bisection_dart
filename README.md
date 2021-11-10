![Generic badge](https://img.shields.io/badge/status-it_works-ok.svg)
[![Pub Package](https://img.shields.io/pub/v/beesect.svg)](https://pub.dev/packages/beesect)
[![pub points](https://badges.bar/beesect/pub%20points)](https://pub.dev/packages/beesect/score)
![Generic badge](https://img.shields.io/badge/testing_on-Windows_|_Linux-blue.svg)
![Generic badge](https://img.shields.io/badge/testing_on-VM_|_JS-blue.svg)

# [beesect](https://github.com/rtmigo/beesect_dart)

Port of the Python [bisect](https://docs.python.org/3/library/bisect.html)
library to the Dart language designed specifically for sectarian bees.

- Maintains a list in sorted order without having to sort
  the list after each insertion
- Searches for values in a sorted list quickly and efficiently

## Basic example

```dart
import 'package:beesect/beesect.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'E'];

  // Find the index of an item in a sorted list
  print(list.bisectLeft('B'));  // 1

  // find the future index for a non-existent item
  print(list.bisectLeft('D'));  // 3

  // add an item to the list while keeping the list sorted
  list.insortLeft('D');
  print(list);  // [A, B, C, D, E]
}
```

## Searching in sorted lists

In addition to the basic functions of the `bisect`
library, [search functions](https://docs.python.org/3/library/bisect.html#searching-sorted-lists)
such as `index`, `find_lt`, `find_le`, `find_gt`, `find_ge` are also
implemented.

```dart
import 'package:beesect/beesect.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'D', 'E'];

  // index of leftmost value exactly equal to 'C'
  print(list.bisectIndex('C')); // 2


  // index of rightmost item Less than or Equal to 'C'
  print(list.bisectIndexLE('C'));  // 2 

  // index of rightmost item Less Than 'C'
  print(list.bisectIndexLT('C'));  // 1

  // index if leftmost item Greater than or Equal to 'C'
  print(list.bisectIndexGE('C'));  // 2

  // index of leftmost Greater Than 'C'
  print(list.bisectIndexGT('C'));  // 3
}
}
```

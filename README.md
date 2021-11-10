# [beesect](https://github.com/rtmigo/beesect_dart)

Port of the Python `bisect` library to the Dart language.


## Basic example

```dart
import 'package:beesect/beesect.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'E'];

  // Find the index of an item in a sorted list
  print(list.bisectLeft('B'));  // prints 1

  // find the future index for a non-existent item
  print(list.bisectLeft('D'));  // prints 3

  // add an item to the list while keeping the list sorted
  list.insortLeft('D');
  print(list);  // [A, B, C, D, E]
}
```

## Searching in sorted lists

In addition to the basic functions of the `bisect` library, [search functions](https://docs.python.org/3/library/bisect.html#searching-sorted-lists) 
such as `index`, `find_lt`, `find_le`, `find_gt`, `find_ge` are implemented:

### Locate items

```dart
import 'package:beesect/beesect.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'D', 'E'];


  // index of leftmost value exactly equal to 'C'
  print(list.bisectIndex('C')); // 2

  // index of rightmost item Less than or Equal to 'C'
  print(list.bisectIndexLE('C')); // 2

  // index of rightmost item Less Than 'C'
  print(list.bisectIndexLT('C')); // 3

  // index if leftmost item Greater than or Equal to 'C'
  print(list.bisectIndexGE('C')); // 2

  // index of leftmost Greater Than 'C'
  print(list.bisectIndexGT('C')); // 1
}
```

### Find and get item values

```dart
import 'package:beesect/beesect.dart';

void main() {
  // The list must be sorted
  var list = ['A', 'B', 'C', 'D', 'E'];

  // value of rightmost item Less than or Equal to 'C'
  print(list.bisectValueLE('C')); // C

  // value of rightmost item Less Than 'C'
  print(list.bisectValueLT('C')); // B

  // value if leftmost item Greater than or Equal to 'C'
  print(list.bisectValueGE('C')); // C

  // value of leftmost Greater Than 'C'
  print(list.bisectValueGT('C')); // D
}

```

# Lists of numbers

`beesect` functions work with lists of objects implementing the `Comparable` 
class.

Although numbers like `int` do not implement this, the problem is easily solved 
by specifying the generic type `num`.

```dart
List<int> numbers = [1, 2, 3];

// insortRight(numbers, 4); // error: int is not a Comparable
// insortRight<int>(numbers, 4); // error: int is not a Comparable

insortRight<num>(numbers, 4);  // this works: num is a Comparable
```
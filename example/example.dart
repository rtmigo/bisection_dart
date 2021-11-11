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
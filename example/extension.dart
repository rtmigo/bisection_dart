import 'package:bisection/extension.dart';

void main() {
  // The list must be sorted
  final arr = ['A', 'B', 'C', 'E'];

  // Find the index of an item in a sorted list
  print(arr.bisectRight('B'));  // 2

  // Find the future index for a non-existent item
  print(arr.bisectLeft('D'));  // 3

  // Add an item to the list while keeping the list sorted
  arr.insortRight('D');
  print(arr);  // [A, B, C, D, E]

  // Locate leftmost value equal to 'C'
  print(arr.bsearch('C'));  // 2

  // Locate leftmost value greater than 'C'
  print(arr.bsearchGreaterThan('C'));  // 3
}


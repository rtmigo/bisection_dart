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


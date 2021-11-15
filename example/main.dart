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
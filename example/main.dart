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

  // Locate leftmost value equal to 'C'
  print(index(arr, 'C'));  //2

  // Find leftmost value greater than 'C'
  print(find_gt(arr, 'C'));  // D
}
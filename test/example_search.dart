import 'package:bisection/bisection.dart';

void main() {
  // the list must be sorted
  var list = ['A', 'B', 'C', 'D', 'E'];

  // index of leftmost value exactly equal to 'C'
  print(list.bsearch('C')); // 2


  // index of rightmost item less than or equal to 'C'
  print(list.bsearchLessThanOrEqualTo('C'));  // 2

  // index of rightmost item less than 'C'
  print(list.bsearchLessThan('C'));  // 1

  // index if leftmost item greater than or equal to 'C'
  print(list.bsearchGreaterThanOrEqualTo('C'));  // 2

  // index of leftmost greater than 'C'
  print(list.bsearchGreaterThan('C'));  // 3
}

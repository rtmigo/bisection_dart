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

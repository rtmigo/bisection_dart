import 'package:bisection/bisect.dart';

void main() {
  final arr = ['zebrA', 'craB', 'coytE'];

  insort(arr, 'lizarD', key: (String e)=>e[e.length-1]);
  print(arr);  // [zebrA, craB, lizarD, coytE]
}
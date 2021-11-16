import 'package:bisection/bisect.dart';

void main() {
  final arr = ['zebrA', 'craB', 'coyotE'];

  insort(arr, 'lizarD', key: (String e)=>e[e.length-1]);
  print(arr);  // [zebrA, craB, lizarD, coyotE]
}
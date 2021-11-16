import 'package:bisection/extension.dart';

void main() {
  final arr = ['zebrA', 'craB', 'coyotE'];

  String lastChar(String s) => s[s.length-1];

  arr.insortRight('lizarD', compare: (a, b) => lastChar(a).compareTo(lastChar(b)));

  print(arr); // [zebrA, craB, lizarD, coyotE]
}

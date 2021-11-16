import 'package:bisection/bisect.dart';
import 'package:test/test.dart';

class C implements Comparable<C> {
  final int x;

  C(this.x);

  @override
  int compareTo(C other) {
    return x.compareTo(other.x);
  }
}

void main() {
  test('int', () {
    final arr = <int>[1, 3, 5];
    expect(bisect<int>(arr, 4), 2);
  });

  test('double', () {
    final arr = <double>[1.0, 3.0, 5.0];
    expect(bisect<double>(arr, 4.0), 2);
  });

  test('num', () {
    final arr = <num>[1, 3.0, 5];
    expect(bisect<num>(arr, 4.0), 2);
  });

  test('Comparable', () {
    final arr = <C>[C(1), C(3), C(5)];
    expect(bisect<C>(arr, C(4)), 2);
  });
}

import 'package:bisection/bisect.dart';
import 'package:test/test.dart';

void main() {
  void printSourceArray() {
    // этим я сгенерировал массивы-исходники. Но вообще мне удобнее константа
    var result = <String>[];

    for (var first in ['A', 'B', 'C']) {
      for (var second in ['x', 'y', 'z']) {
        result.add(first + second);
      }
    }

    result.shuffle();

    for (int i = 0; i < result.length; ++i) {
      result[i] += (i + 1).toString();
    }

    print(result.map((e) => "'$e'"));

    //return result;
  }

  //printSourceArray();

  //print(genSourceArray());

  // //final random = Random();
  //
  test('no key, no comparator', () {
    final source = ['Cz1', 'By2', 'Cx3', 'Cy4', 'Az5', 'Bx6', 'Ax7', 'Ay8', 'Bz9'];

    var sorted = <String>[];
    for (var x in source) {
      insort(sorted, x);
    }

    // simple alpha sort
    expect(sorted, ['Ax7', 'Ay8', 'Az5', 'Bx6', 'By2', 'Bz9', 'Cx3', 'Cy4', 'Cz1']);
  });

  test('key insort_right by second char', () {
    final source = ['Cz1', 'By2', 'Cx3', 'Cy4', 'Az5', 'Bx6', 'Ax7', 'Ay8', 'Bz9'];

    var sorted = <String>[];

    String secondChar(String x) {
      return x[1];
    }

    for (var x in source) {
      insort_right(sorted, x, key: secondChar);
    }

    expect(sorted, ['Cx3', 'Bx6', 'Ax7', 'By2', 'Cy4', 'Ay8', 'Cz1', 'Az5', 'Bz9']);
  });

  test('key insort_left by second char', () {
    final source = ['Cz1', 'By2', 'Cx3', 'Cy4', 'Az5', 'Bx6', 'Ax7', 'Ay8', 'Bz9'];

    var sorted = <String>[];

    String secondChar(String x) {
      return x[1];
    }

    for (var x in source) {
      insort_left(sorted, x, key: secondChar);
    }

    // we were inserting new items at left, so when the second char is the same,
    // numbers are decreasing
    expect(sorted, ['Ax7', 'Bx6', 'Cx3', 'Ay8', 'Cy4', 'By2', 'Bz9', 'Az5', 'Cz1']);
  });

  test('cannot specify both', () {
    final arr = ['Cz1', 'By2', 'Cx3', 'Cy4', 'Az5', 'Bx6', 'Ax7', 'Ay8', 'Bz9'];
    final keyFunc = (String e)=>e.length;
    final compareFunc = (String a, String b) => a.length.compareTo(b.length);
    expect(bisect(arr, 'B'), 8);
    expect(bisect(arr, 'B', key: keyFunc), 0);
    expect(bisect(arr, 'B', compare: compareFunc), 0);
    expect(()=>bisect(arr, 'B', compare: compareFunc, key: keyFunc), throwsArgumentError);
  });
}

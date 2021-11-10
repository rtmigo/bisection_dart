// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:beesect/beesect.dart';
import 'package:test/test.dart';

/// Items will be compared by only the first letter if [str].
class Item implements Comparable<Item> {
  final String str;

  Item(this.str);

  @override
  int compareTo(Item other) {
    return this.str[0].compareTo(other.str[0]);
  }

  operator ==(Object other) {
    return this.compareTo(other as Item) == 0;
  }

  @override
  String toString() {
    return "Char('${this.str}')";
  }
}

void main() {
  test('insort left', () {
    var list = [Item('A'), Item('C'), Item('E'), Item('G')];
    insortLeft(list, Item('B1'));
    expect(list, [Item('A'), Item('B1'), Item('C'), Item('E'), Item('G')]);
    // inserting E1 at LEFT to E
    insortLeft(list, Item('E1'));
    expect(list, [Item('A'), Item('B1'), Item('C'), Item('E1'), Item('E'), Item('G')]);
  });

  test('insort right', () {
    var list = [Item('A'), Item('C'), Item('E'), Item('G')];
    insortRight(list, Item('B1'));
    expect(list, [Item('A'), Item('B1'), Item('C'), Item('E'), Item('G')]);
    // inserting E1 at RIGHT to E
    insortRight(list, Item('E1'));
    expect(list, [Item('A'), Item('B1'), Item('C'), Item('E'), Item('E1'), Item('G')]);
  });

  test('insort left to empty', () {
    var list = <int>[];
    insortLeft<num>(list, 5);
    insortLeft<num>(list, 2);
    insortLeft<num>(list, 3);
    insortLeft<num>(list, 4);
    insortLeft<num>(list, 3);
    insortLeft<num>(list, 1);
    expect(list, [1, 2, 3, 3, 4, 5]);
  });

  test('insort right to empty', () {
    List<int> list = <int>[];
    insortRight<num>(list, 5);
    insortRight<num>(list, 2);
    insortRight<num>(list, 3);
    insortRight<num>(list, 4);
    insortRight<num>(list, 3);
    insortRight<num>(list, 1);
    expect(list, [1, 2, 3, 3, 4, 5]);
  });


}

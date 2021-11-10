// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:beesect/beesect.dart';
import 'package:test/test.dart';

void main() {
  test('bisect left', () {
    var list = ['A', 'C', 'E', 'G'];
    expect(list.bisectLeft('B'), 1);
    expect(list.bisectLeft('C'), 1);
  });

  test('bisect right', () {
    var list = ['A', 'C', 'E', 'G'];
    expect(list.bisectRight('B'), 1);
    expect(list.bisectRight('C'), 2);
  });

  test('insort right', () {
    var list = ['A', 'C', 'E', 'G'];
    list.insortRight('F');
    expect(list, ['A', 'C', 'E', 'F', 'G']);
  });

  test('insort left', () {
    var list = ['A', 'C', 'E', 'G'];
    list.insortLeft('F');
    expect(list, ['A', 'C', 'E', 'F', 'G']);
  });

  test('insort right: comparator', () {
    var list = ['A', 'C', 'E', 'G'];
    list.insortRight('E_new', compare: (a, b) => a[0].compareTo(b[0]));
    expect(list, ['A', 'C', 'E', 'E_new', 'G']);
  });

  test('insort left: comparator', () {
    var list = ['A', 'C', 'E', 'G'];
    list.insortLeft('E_new', compare: (a, b) => a[0].compareTo(b[0]));
    expect(list, ['A', 'C', 'E_new', 'E', 'G']);
  });

  test('index of', () {
    var list = ['A', 'C', 'E', 'G'];
    expect(list.bisectIndex('E'), 2);
    expect(()=>list.bisectIndex('F'), throwsA(isA<ItemNotFoundError>()));
  });

  var isNotFound = throwsA(isA<ItemNotFoundError>());

  test('rightmost less', () {
    var list = ['B', 'D', 'F'];
    expect(()=>list.bisectIndexLT('A'), isNotFound);
    expect(()=>list.bisectIndexLT('B'), isNotFound);
    expect(list.bisectIndexLT('C'), 0);
    expect(list.bisectIndexLT('D'), 0);
    expect(list.bisectIndexLT('E'), 1);
    expect(list.bisectIndexLT('F'), 1);
    expect(list.bisectIndexLT('G'), 2);
  });

  test('rightmost less equal', () {
    var list = ['B', 'D', 'F'];
    expect(()=>list.bisectIndexLE('A'), isNotFound);
    expect(list.bisectIndexLE('B'), 0);
    expect(list.bisectIndexLE('C'), 0);
    expect(list.bisectIndexLE('D'), 1);
    expect(list.bisectIndexLE('E'), 1);
    expect(list.bisectIndexLE('F'), 2);
    expect(list.bisectIndexLE('G'), 2);
  });

  test('index gt: leftmost value greater than', () {
    var list = ['B', 'D', 'F'];
    expect(list.bisectIndexGT('A'), 0);
    expect(list.bisectIndexGT('B'), 1);
    expect(list.bisectIndexGT('C'), 1);
    expect(list.bisectIndexGT('D'), 2);
    expect(list.bisectIndexGT('E'), 2);
    expect(()=>list.bisectIndexGT('F'), isNotFound);
    expect(()=>list.bisectIndexGT('G'), isNotFound);
  });

  test('index ge: leftmost item greater than or equal to x', () {
    var list = ['B', 'D', 'F'];
    expect(list.bisectIndexGE('A'), 0);
    expect(list.bisectIndexGE('B'), 0);
    expect(list.bisectIndexGE('C'), 1);
    expect(list.bisectIndexGE('D'), 1);
    expect(list.bisectIndexGE('E'), 2);
    expect(list.bisectIndexGE('F'), 2);
    expect(()=>list.bisectIndexGE('G'), isNotFound);
  });

  test('get items', () {
    var list = ['B', 'D', 'F'];
    expect(list.bisectValueLE('D'), 'D');
    expect(list.bisectValueLT('D'), 'B');
    expect(list.bisectValueGE('D'), 'D');
    expect(list.bisectValueGT('D'), 'F');
  });

}

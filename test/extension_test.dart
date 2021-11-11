// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:bisection/bisection.dart';
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
    expect(list.bsearch('E'), 2);
    expect(()=>list.bsearch('F'), throwsA(isA<ItemNotFoundError>()));
  });

  var isNotFound = throwsA(isA<ItemNotFoundError>());

  test('rightmost less', () {
    var list = ['B', 'D', 'F'];
    expect(()=>list.bsearchLessThan('A'), isNotFound);
    expect(()=>list.bsearchLessThan('B'), isNotFound);
    expect(list.bsearchLessThan('C'), 0);
    expect(list.bsearchLessThan('D'), 0);
    expect(list.bsearchLessThan('E'), 1);
    expect(list.bsearchLessThan('F'), 1);
    expect(list.bsearchLessThan('G'), 2);
  });

  test('rightmost less equal', () {
    var list = ['B', 'D', 'F'];
    expect(()=>list.bsearchLessThanOrEqualTo('A'), isNotFound);
    expect(list.bsearchLessThanOrEqualTo('B'), 0);
    expect(list.bsearchLessThanOrEqualTo('C'), 0);
    expect(list.bsearchLessThanOrEqualTo('D'), 1);
    expect(list.bsearchLessThanOrEqualTo('E'), 1);
    expect(list.bsearchLessThanOrEqualTo('F'), 2);
    expect(list.bsearchLessThanOrEqualTo('G'), 2);
  });

  test('index gt: leftmost value greater than', () {
    var list = ['B', 'D', 'F'];
    expect(list.bsearchGreaterThan('A'), 0);
    expect(list.bsearchGreaterThan('B'), 1);
    expect(list.bsearchGreaterThan('C'), 1);
    expect(list.bsearchGreaterThan('D'), 2);
    expect(list.bsearchGreaterThan('E'), 2);
    expect(()=>list.bsearchGreaterThan('F'), isNotFound);
    expect(()=>list.bsearchGreaterThan('G'), isNotFound);
  });

  test('index ge: leftmost item greater than or equal to x', () {
    var list = ['B', 'D', 'F'];
    expect(list.bsearchGreaterThanOrEqualTo('A'), 0);
    expect(list.bsearchGreaterThanOrEqualTo('B'), 0);
    expect(list.bsearchGreaterThanOrEqualTo('C'), 1);
    expect(list.bsearchGreaterThanOrEqualTo('D'), 1);
    expect(list.bsearchGreaterThanOrEqualTo('E'), 2);
    expect(list.bsearchGreaterThanOrEqualTo('F'), 2);
    expect(()=>list.bsearchGreaterThanOrEqualTo('G'), isNotFound);
  });

  test('get items', () {
    var list = ['B', 'D', 'F'];
    expect(list[list.bsearchLessThanOrEqualTo('D')], 'D');
    expect(list[list.bsearchLessThan('D')], 'B');
    expect(list[list.bsearchGreaterThanOrEqualTo('D')], 'D');
    expect(list[list.bsearchGreaterThan('D')], 'F');
  });

}

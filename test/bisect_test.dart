// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:beesect/beesect.dart';
import 'package:test/test.dart';

void main() {
  void checkBSR(bsr) {
    //               0  1  2  3  4  5  6  7  8  9
    List<int> lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];

    expect(bsr(lst, -2), 0);
    expect(bsr(lst, -1), 0);
    expect(bsr(lst, 0), 1);
    expect(bsr(lst, 1), 2);
    expect(bsr(lst, 2), 6);
    expect(bsr(lst, 3), 8);
    expect(bsr(lst, 4), 8);
    expect(bsr(lst, 5), 9);
    expect(bsr(lst, 6), 10);
    expect(bsr(lst, 7), 10);
    expect(bsr(lst, 8), 10);
  }

  test('bisect_right_int', () {
    checkBSR(bisectRightNum);
  });

  test('bisect_right_comparable', () {
    //int
    checkBSR((lst, x) => bisectRight<num>(lst, x));
  });

  void checkBSL(bsl) {
    //               0  1  2  3  4  5  6  7  8  9
    List<int> lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];

    expect(bsl(lst, -2), 0);
    expect(bsl(lst, -1), 0);
    expect(bsl(lst, 0), 0);
    expect(bsl(lst, 1), 1);
    expect(bsl(lst, 2), 2);
    expect(bsl(lst, 3), 6);
    expect(bsl(lst, 4), 8);
    expect(bsl(lst, 5), 8);
    expect(bsl(lst, 6), 9);
    expect(bsl(lst, 7), 10);
    expect(bsl(lst, 8), 10);
  }

  test('bisect_left_int', () {
    checkBSL(bisectLeftNum);
  });

  test('bisect_left_comparable', () {
    checkBSL((lst, x) => bisectLeft<num>(lst, x));
  });

  test('index', () {
    final lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];
    expect(indexOf<num>(lst, -2, dontPanic: true), null);
    expect(indexOf<num>(lst, -1, dontPanic: true), null);
    expect(indexOf<num>(lst, 0, dontPanic: true), 0);
    expect(indexOf<num>(lst, 1, dontPanic: true), 1);
    expect(indexOf<num>(lst, 2, dontPanic: true), 2);
    expect(indexOf<num>(lst, 3, dontPanic: true), 6);
    expect(indexOf<num>(lst, 4, dontPanic: true), null);
    expect(indexOf<num>(lst, 5, dontPanic: true), 8);
    expect(indexOf<num>(lst, 6, dontPanic: true), 9);
    expect(indexOf<num>(lst, 7, dontPanic: true), null);
    expect(indexOf<num>(lst, 8, dontPanic: true), null);
  });

  test('find_lt', () {
    final lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];
    expect(itemLT<num>(lst, -2, dontPanic: true), null);
    expect(itemLT<num>(lst, -1, dontPanic: true), null);
    expect(itemLT<num>(lst, 0, dontPanic: true), null);
    expect(itemLT<num>(lst, 1, dontPanic: true), 0);
    expect(itemLT<num>(lst, 2, dontPanic: true), 1);
    expect(itemLT<num>(lst, 3, dontPanic: true), 2);
    expect(itemLT<num>(lst, 4, dontPanic: true), 3);
    expect(itemLT<num>(lst, 5, dontPanic: true), 3);
    expect(itemLT<num>(lst, 6, dontPanic: true), 5);
    expect(itemLT<num>(lst, 7, dontPanic: true), 6);
    expect(itemLT<num>(lst, 8, dontPanic: true), 6);
  });

  test('find_le', () {
    final lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];
    expect(itemLE<num>(lst, -2, dontPanic: true), null);
    expect(itemLE<num>(lst, -1, dontPanic: true), null);
    expect(itemLE<num>(lst, 0, dontPanic: true), 0);
    expect(itemLE<num>(lst, 1, dontPanic: true), 1);
    expect(itemLE<num>(lst, 2, dontPanic: true), 2);
    expect(itemLE<num>(lst, 3, dontPanic: true), 3);
    expect(itemLE<num>(lst, 4, dontPanic: true), 3);
    expect(itemLE<num>(lst, 5, dontPanic: true), 5);
    expect(itemLE<num>(lst, 6, dontPanic: true), 6);
    expect(itemLE<num>(lst, 7, dontPanic: true), 6);
    expect(itemLE<num>(lst, 8, dontPanic: true), 6);
  });

  test('find_gt', () {
    final lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];
    expect(itemGT<num>(lst, -2, dontPanic: true), 0);
    expect(itemGT<num>(lst, -1, dontPanic: true), 0);
    expect(itemGT<num>(lst, 0, dontPanic: true), 1);
    expect(itemGT<num>(lst, 1, dontPanic: true), 2);
    expect(itemGT<num>(lst, 2, dontPanic: true), 3);
    expect(itemGT<num>(lst, 3, dontPanic: true), 5);
    expect(itemGT<num>(lst, 4, dontPanic: true), 5);
    expect(itemGT<num>(lst, 5, dontPanic: true), 6);
    expect(itemGT<num>(lst, 6, dontPanic: true), null);
    expect(itemGT<num>(lst, 7, dontPanic: true), null);
    expect(itemGT<num>(lst, 8, dontPanic: true), null);
  });

  test('find_ge', () {
    final lst = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6];
    expect(itemGE<num>(lst, -2, dontPanic: true), 0);
    expect(itemGE<num>(lst, -1, dontPanic: true), 0);
    expect(itemGE<num>(lst, 0, dontPanic: true), 0);
    expect(itemGE<num>(lst, 1, dontPanic: true), 1);
    expect(itemGE<num>(lst, 2, dontPanic: true), 2);
    expect(itemGE<num>(lst, 3, dontPanic: true), 3);
    expect(itemGE<num>(lst, 4, dontPanic: true), 5);
    expect(itemGE<num>(lst, 5, dontPanic: true), 5);
    expect(itemGE<num>(lst, 6, dontPanic: true), 6);
    expect(itemGE<num>(lst, 7, dontPanic: true), null);
    expect(itemGE<num>(lst, 8, dontPanic: true), null);
  });
}

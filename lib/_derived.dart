// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// the bisect source in Python:
// https://docs.python.org/3/library/bisect.html
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24

import '_bisect.dart';

class ItemNotFoundError {
  //ItemNotFoundError(x): super(x, 'Item not found');
}

void insortRight<T>(List<T> a, T x,
    {Comparator<T>? compare, int lo = 0, int? hi}) {
  // todo test custom compare
  // todo test lo and hi
  var low = bisectRight<T>(a, x, lo: lo, hi: hi, compare: compare);
  a.insert(low, x);
}

void insortLeft<T>(List<T> a, T x,
    {Comparator<T>? compare, int lo = 0, int? hi}) {
  // todo test custom compare
  // todo test lo and hi
  var low = bisectLeft<T>(a, x, lo: lo, hi: hi, compare: compare);
  a.insert(low, x);
}

/// Locate the leftmost value exactly equal to [x].
int? indexOf<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisectLeft<T>(a, x);
  if (i != a.length && a[i].compareTo(x) == 0) {
    return i;
  }

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate rightmost value less than [x].
int? indexOfLT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisectLeft(a, x);
  if (i != 0) {
    return i - 1;
  }

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate rightmost value less than or equal to [x].
int? indexOfLE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisectRight(a, x);
  if (i != 0) return i - 1;

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate leftmost value greater than [x]
int? indexOfGT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisectRight(a, x);
  if (i != a.length) return i;

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate leftmost item greater than or equal to [x]
int? indexOfGE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisectLeft(a, x);
  if (i != a.length) return i;

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

T? itemLT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfLT(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

T? itemLE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfLE(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

T? itemGT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfGT(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

T? itemGE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfGE(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

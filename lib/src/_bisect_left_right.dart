// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// `bisectLeft` and `bisectRight` rewritted from a Java port (https://stackoverflow.com/a/39702057)
// SPDX-FileCopyrightText: (c) 2016 Profiterole (CC BY-SA 3.0)

// The functions are rewritten in Dart, comparison operators replaced with Comparator functions

import '_comparator.dart';

int bisectRight<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  compare ??= get_comparator<T>();

  if (lo < 0) {
    throw ArgumentError.value(lo, 'lo');
  }
  hi ??= a.length;

  int N = a.length;
  if (N == 0) {
    return 0;
  }
  if (compare(x, a[lo]) < 0) {
    return lo;
  }
  if (compare(x, a[hi - 1]) > 0) {
    return hi;
  }
  for (;;) {
    if (lo + 1 == hi) {
      return lo + 1;
    }
    int mi = (hi! + lo) ~/ 2;
    if (compare(x, a[mi]) < 0) {
      hi = mi;
    } else {
      lo = mi;
    }
  }
}

int bisectLeft<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  compare ??= get_comparator<T>();

  //if (lo == null) lo = 0;
  if (lo < 0) {
    throw ArgumentError.value(lo, 'lo');
  }
  hi ??= a.length;

  int N = a.length;
  if (N == 0) {
    return 0;
  }
  if (compare(x, a[lo]) < 0) {
    return lo;
  }
  if (compare(x, a[hi - 1]) > 0) {
    return hi;
  }
  for (;;) {
    if (lo + 1 == hi) {
      return x == a[lo] ? lo : (lo + 1);
    }
    int mi = (hi! + lo) ~/ 2;
    if (compare(x, a[mi]) <= 0) {
      hi = mi;
    } else {
      lo = mi;
    }
  }
}

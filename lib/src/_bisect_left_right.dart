// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// the bisect source in Python:
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24
// https://github.com/python/cpython/blob/3.9/Lib/bisect.py#L24

import '_comparator.dart';

int bisect_right<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  compare ??= get_comparator<T>();

  if (lo < 0) {
    throw ArgumentError.value(lo, 'lo must be non-negative'); // in Python this disallowed too
  }
  if (hi!=null && hi<0) {
    // Python allows negative hi values, but returns strange results.
    // I failed to make a Dart code that returns the same, in particular in the case of hi=-1.
    // In any case, negative hi does not make sense
    throw ArgumentError.value(lo, 'hi must be non-negative');
  }

  int h = hi ?? a.length;

  while (lo < h) {
    var mid = (lo + h) >> 1; // in Python it's `//2`
    if (compare(x, a[mid]) < 0) {
      h = mid;
    } else {
      lo = mid + 1;
    }
  }

  return lo;
}

int bisect_left<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  compare ??= get_comparator<T>();

  if (lo < 0) {
    throw ArgumentError.value(lo, 'lo must be non-negative'); // in Python this disallowed too
  }
  if (hi!=null && hi<0) {
    // Python allows negative hi values, but returns strange results.
    // I failed to make a Dart code that returns the same, in particular in the case of hi=-1.
    // In any case, negative hi does not make sense
    throw ArgumentError.value(lo, 'hi must be non-negative');
  }

  int h = hi ?? a.length;

  while (lo < h) {
    int mid = (lo + h) >> 1; // in Python it's `//2`
    if (compare(a[mid], x) < 0) {
      lo = mid + 1;
    } else {
      h = mid;
    }
  }
  return lo;
}

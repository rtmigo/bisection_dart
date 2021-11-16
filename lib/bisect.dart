// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// the bisect source in Python:
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24
// https://github.com/python/cpython/blob/3.9/Lib/bisect.py#L24

import 'src/_comparator.dart';

int bisect_right<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  compare ??= get_comparator<T>();

  if (lo < 0) {
    throw ArgumentError.value(lo, 'lo must be non-negative'); // in Python this disallowed too
  }
  if (hi != null && hi < 0) {
    // Python allows negative `hi` values, but returns strange results.
    // I failed to make a Dart code that returns the same, in particular in the case of `hi=-1`.
    // But negative `hi` does not make sense. So we'll just disallow it
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
  if (hi != null && hi < 0) {
    // Python allows negative `hi` values, but returns strange results.
    // I failed to make a Dart code that returns the same, in particular in the case of `hi=-1`.
    // But negative `hi` does not make sense. So we'll just disallow it
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

/// Assuming the list is sorted, insert [item] in list in sorted order.
void insort_left<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  a.insert(bisect_left(a, x, compare: compare, lo: lo, hi: hi), x);
}

/// Similar to [insort_left], but inserting [item] in list after any existing entries of [item].
void insort_right<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  a.insert(bisect_right(a, x, compare: compare, lo: lo, hi: hi), x);
}

///Locate the leftmost value exactly equal to x
int? index<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  compare ??= get_comparator();
  final i = bisect_left(a, x, compare: compare, lo: lo, hi: hi);
  if (i != a.length && compare(a[i], x) == 0) {
    return i;
  }
  throw ArgumentError('Value not found');
}

/// Find rightmost value less than x
T find_lt<T>(List<T> a, T x, {Comparator<T>? compare}) {
  int i = bisect_left(a, x, compare: compare);
  if (i != 0) {
    return a[i - 1];
  }
  throw ArgumentError('Value not found');
}

/// Find rightmost value less than or equal to x
T find_le<T>(List<T> a, T x, {Comparator<T>? compare}) {
  int i = bisect_right(a, x, compare: compare);
  if (i != 0) {
    return a[i - 1];
  }
  throw ArgumentError('Value not found');
}

/// Find leftmost value greater than x
T find_gt<T>(List<T> a, T x, {Comparator<T>? compare}) {
  int i = bisect_right(a, x, compare: compare);
  if (i != a.length) {
    return a[i];
  }
  throw ArgumentError('Value not found');
}

/// Find leftmost item greater than or equal to x
T find_ge<T>(List<T> a, T x, {Comparator<T>? compare}) {
  int i = bisect_left(a, x, compare: compare);
  if (i != a.length) {
    return a[i];
  }
  throw ArgumentError('Value not found');
}

const bisect = bisect_right;
const insort = insort_right;

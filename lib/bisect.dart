// SPDX-FileCopyrightText: (c) 2019-2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// the bisect source in Python:
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24
// https://github.com/python/cpython/blob/3.9/Lib/bisect.py#L24

import 'src/_comparator.dart';

/// Locate the insertion point for x in a to maintain sorted order. The parameters [lo] and [hi]
/// may be used to specify a subset of the list which should be considered; by default the entire
/// list is used. If [x] is already present in [a], the insertion point will be before (to the
/// left of) any existing entries. The return value is suitable for use as the first parameter
/// to `List.insert` assuming that a is already sorted.
int bisect_left<E>(List<E> a, E x,
    {int lo = 0, int? hi, ToKey<E, Object>? key, Comparator<E>? compare}) {
  compare = argToComparator<E>(compare, key);

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

/// Similar to [bisect_left], but returns an insertion point which comes after (to the right of)
/// any existing entries of [x] in [a].
int bisect_right<E>(List<E> a, E x,
    {int lo = 0, int? hi, ToKey<E, Object>? key, Comparator<E>? compare}) {
  compare = argToComparator<E>(compare, key);

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

/// Assuming the list is sorted, insert [item] in list in sorted order.
void insort_left<E>(List<E> a, E x,
    {Comparator<E>? compare, ToKey<E, Object>? key, int lo = 0, int? hi}) {
  a.insert(bisect_left(a, x, compare: compare, lo: lo, hi: hi, key: key), x);
}

/// Similar to [insort_left], but inserting [item] in list after any existing entries of [item].
void insort_right<E>(List<E> a, E x,
    {Comparator<E>? compare, ToKey<E, Object>? key, int lo = 0, int? hi}) {
  a.insert(bisect_right(a, x, compare: compare, lo: lo, hi: hi, key: key), x);
}

///Locate the leftmost value exactly equal to x
int? index<E>(List<E> a, E x,
    {Comparator<E>? compare, ToKey<E, Object>? key, int lo = 0, int? hi}) {
  // todo unit-test custom compare and key
  compare = argToComparator<E>(compare, key);
  final i = bisect_left(a, x, compare: compare, lo: lo, hi: hi);
  if (i != a.length && compare(a[i], x) == 0) {
    return i;
  }
  throw ArgumentError('Value not found');
}

/// Find rightmost value less than x
E find_lt<E>(List<E> a, E x, {Comparator<E>? compare}) {
  // todo unit-test custom compare and key
  int i = bisect_left(a, x, compare: compare);
  if (i != 0) {
    return a[i - 1];
  }
  throw ArgumentError('Value not found');
}

/// Find rightmost value less than or equal to x
E find_le<E>(List<E> a, E x, {Comparator<E>? compare, ToKey<E, Object>? key}) {
  // todo unit-test custom compare and key
  int i = bisect_right(a, x, compare: compare, key: key);
  if (i != 0) {
    return a[i - 1];
  }
  throw ArgumentError('Value not found');
}

/// Find leftmost value greater than x
E find_gt<E>(List<E> a, E x, {Comparator<E>? compare, ToKey<E, Object>? key}) {
  // todo unit-test custom compare and key
  int i = bisect_right(a, x, compare: compare, key: key);
  if (i != a.length) {
    return a[i];
  }
  throw ArgumentError('Value not found');
}

/// Find leftmost item greater than or equal to x
E find_ge<E>(List<E> a, E x, {Comparator<E>? compare, ToKey<E, Object>? key}) {
  // todo unit-test custom compare and key
  int i = bisect_left(a, x, compare: compare, key: key);
  if (i != a.length) {
    return a[i];
  }
  throw ArgumentError('Value not found');
}

/// Same as [bisect_right].
const bisect = bisect_right;

/// Same as [insort_right].
const insort = insort_right;

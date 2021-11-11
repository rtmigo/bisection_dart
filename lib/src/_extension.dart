// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// the bisect source in Python:
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24

import '_bisect_left_right.dart' as brl;
import '_comparator.dart';

extension SortedListExtension<T> on List<T> {
  /// Assuming the list is sorted, locate the insertion point for [item] in a to maintain sorted order.
  int bisectLeft(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    return brl.bisectLeft(this, item, compare: compare, lo: low, hi: high);
  }

  /// Similar to [bisectLeft], but returns an insertion point which comes after (to the right of)
  /// any existing entries of [item] in the list.
  int bisectRight(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    return brl.bisectRight(this, item, compare: compare, lo: low, hi: high);
  }

  /// Assuming the list is sorted, insert [item] in list in sorted order.
  void insortLeft(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    this.insert(this.bisectLeft(item, compare: compare, low: low, high: high), item);
  }

  /// Similar to [insortLeft], but inserting [item] in list after any existing entries of [item].
  void insortRight(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    this.insert(this.bisectRight(item, compare: compare, low: low, high: high), item);
  }

  /// Assuming the list is sorted, locate the leftmost element exactly equal to [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearch(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    compare ??= get_comparator();
    final i = this.bisectLeft(x, compare: compare, low: low, high: high);
    if (i != this.length && compare(this[i], x) == 0) {
      return i;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate rightmost element less than [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchLessThan(T x, {Comparator<T>? compare, int low = 0, int? high}) {

    // final i = bisectLeft(a, x);
    // if (i != 0) {
    //   return i - 1;
    // }

    final i = this.bisectLeft(x, compare: compare, low: low, high: high);
    if (i != 0) {
      return i - 1;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate rightmost element less than or equal to [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchLessThanOrEqualTo(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectRight(x, compare: compare, low: low, high: high);
    if (i != 0) {
      return i - 1;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate leftmost element greater than [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchGreaterThan(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectRight(x, compare: compare, low: low, high: high);
    if (i != this.length) {
      return i;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate leftmost item greater than or equal to [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchGreaterThanOrEqualTo(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectLeft(x, compare: compare, low: low, high: high);
    if (i != this.length) {
      return i;
    }
    return -1;
  }
}

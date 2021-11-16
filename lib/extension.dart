// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

// the bisect source in Python:
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24

import 'bisect.dart' as funcs;
import 'src/_comparator.dart';

extension SortedListExtension<E> on List<E> {
  /// Assuming the list is sorted, locate the insertion point for [item] in a to maintain sorted order.
  int bisectLeft(E item, {Comparator<E>? compare, int low = 0, int? high}) {
    return funcs.bisect_left(this, item, compare: compare, lo: low, hi: high);
  }

  /// Similar to [bisectLeft], but returns an insertion point which comes after (to the right of)
  /// any existing entries of [item] in the list.
  int bisectRight(E item, {Comparator<E>? compare, int low = 0, int? high}) {
    return funcs.bisect_right(this, item, compare: compare, lo: low, hi: high);
  }

  /// Assuming the list is sorted, insert [item] in list in sorted order.
  void insortLeft(E item, {Comparator<E>? compare, int low = 0, int? high}) {
    this.insert(this.bisectLeft(item, compare: compare, low: low, high: high), item);
  }

  /// Similar to [insortLeft], but inserting [item] in list after any existing entries of [item].
  void insortRight(E item, {Comparator<E>? compare, int low = 0, int? high}) {
    this.insert(this.bisectRight(item, compare: compare, low: low, high: high), item);
  }

  /// Assuming the list is sorted, locate the leftmost element exactly equal to [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearch(E x, {Comparator<E>? compare, int low = 0, int? high}) {
    compare ??= genericToComparator(null);
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
  int bsearchLessThan(E x, {Comparator<E>? compare}) {
    final i = this.bisectLeft(x, compare: compare);
    if (i != 0) {
      return i - 1;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate rightmost element less than or equal to [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchLessThanOrEqualTo(E x, {Comparator<E>? compare}) {
    final i = this.bisectRight(x, compare: compare);
    if (i != 0) {
      return i - 1;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate leftmost element greater than [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchGreaterThan(E x, {Comparator<E>? compare}) {
    final i = this.bisectRight(x, compare: compare);
    if (i != this.length) {
      return i;
    }
    return -1;
  }

  /// Assuming the list is sorted, locate leftmost item greater than or equal to [x].
  ///
  /// If the element is found, the index of element is returned. If not found, -1
  /// is returned.
  int bsearchGreaterThanOrEqualTo(E x, {Comparator<E>? compare}) {
    final i = this.bisectLeft(x, compare: compare);
    if (i != this.length) {
      return i;
    }
    return -1;
  }
}

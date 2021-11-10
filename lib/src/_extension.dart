// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import '_bisect_left_right.dart' as brl;
import '_common.dart';

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

  /// Assuming the list is sorted, locate the leftmost value exactly equal to [x].
  int bisectIndex(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    compare ??= brl.default_compare;
    final i = this.bisectLeft(x, compare: compare, low: low, high: high);
    if (i != this.length && compare(this[i], x) == 0) {
      return i;
    }
    throw ItemNotFoundError();
  }

  /// Assuming the list is sorted, locate rightmost value less than [x].
  int bisectIndexLT(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectLeft(x, compare: compare, low: low, high: high);
    if (i != 0) {
      return i - 1;
    }
    throw ItemNotFoundError();
  }

  /// Assuming the list is sorted, locate rightmost value less than or equal to [x].
  int bisectIndexLE(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectRight(x, compare: compare, low: low, high: high);
    if (i != 0) {
      return i - 1;
    }
    throw ItemNotFoundError();
  }

  /// Assuming the list is sorted, locate leftmost value greater than [x]
  int bisectIndexGT(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectRight(x, compare: compare, low: low, high: high);
    if (i != this.length) {
      return i;
    }
    throw ItemNotFoundError();
  }

  /// Assuming the list is sorted, locate leftmost item greater than or equal to [x]
  int bisectIndexGE(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    final i = this.bisectLeft(x, compare: compare, low: low, high: high);
    if (i != this.length) {
      return i;
    }
    throw ItemNotFoundError();
  }
}

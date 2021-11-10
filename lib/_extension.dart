import '_bisect.dart' as funcs_b;

//import '_bisect.dart';
import '_derived.dart' as funcs_d;
import '_derived.dart';

extension SortedListExtension<T> on List<T> {
  int bisectLeft(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    return funcs_b.bisectLeft(this, item, compare: compare, lo: low, hi: high);
  }

  int bisectRight(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    return funcs_b.bisectRight(this, item, compare: compare, lo: low, hi: high);
  }

  void insortLeft(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    funcs_d.insortLeft<T>(this, item, compare: compare, lo: low, hi: high);
  }

  void insortRight(T item, {Comparator<T>? compare, int low = 0, int? high}) {
    return funcs_d.insortRight(this, item, compare: compare, lo: low, hi: high);
  }

  /// Assuming the list is sorted, locate the leftmost value exactly equal to [x].
  int bisectIndex(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    compare ??= funcs_b.default_compare;
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

  /// Assuming the list is sorted, get rightmost value less than [x].
  T bisectValueLT(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    return this[bisectIndexLT(x, compare: compare, low: low, high: high)];
  }

  /// Assuming the list is sorted, get rightmost value less than or equal to [x].
  T bisectValueLE(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    return this[bisectIndexLE(x, compare: compare, low: low, high: high)];
  }

  /// Assuming the list is sorted, get leftmost value greater than [x]
  T bisectValueGT(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    return this[bisectIndexGT(x, compare: compare, low: low, high: high)];
  }


  /// Assuming the list is sorted, get leftmost item greater than or equal to [x].
  T bisectValueGE(T x, {Comparator<T>? compare, int low = 0, int? high}) {
    return this[bisectIndexGE(x, compare: compare, low: low, high: high)];
  }

}

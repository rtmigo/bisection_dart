// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

/// Compares two items dynamically interpreting them as [Comparable<T>].
int _compare_as_comparables<T>(T a, T b) {
  return (a as Comparable<T>).compareTo(b);
}

int _compare_num(num a, num b) {
  return a.compareTo(b);
}

Comparator<T> _get_direct_comparator<T>() {
  if (T == int || T == double) {
    // in Dart 2.14 we would get an exception if we tried to convert a variable of type
    // `int` directly to `Comparable<int>`. But if we assign the value to num, it is a comparable.
    // TODO benchmark speed: maybe the speed will be higher without num at all
    return _compare_num as Comparator<T>;
  }
  return _compare_as_comparables;
}

typedef ItemToKey<T, K> = K Function(T item);


Comparator<T> get_comparator<T>(ItemToKey<T, dynamic>? i2k) {
  if (i2k == null) {
    return _get_direct_comparator<T>();
  } else {
    final keys_comparator = _get_direct_comparator<dynamic>();
    return (T a, T b) => keys_comparator(i2k(a), i2k(b));
  }
}

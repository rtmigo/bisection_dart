// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

/// Compares two items dynamically interpreting them as [Comparable<E>].
int _compare_as_comparables<E>(E a, E b) {
  return (a as Comparable<E>).compareTo(b);
}

int _compare_num(num a, num b) {
  return a.compareTo(b);
}

Comparator<E> _get_direct_comparator<E>() {
  if (E == int || E == double) {
    // in Dart 2.14 we would get an exception if we tried to convert a variable of type
    // `int` directly to `Comparable<int>`. But if we assign the value to num, it is a comparable.
    // TODO benchmark speed: maybe the speed will be higher without num at all
    return _compare_num as Comparator<E>;
  }
  return _compare_as_comparables;
}

typedef ToKey<E, K> = K Function(E item);

Comparator<E> argToComparator<E>(Comparator<E>? compare, ToKey<E, Object>? key) {
  if (compare != null) {
    if (key != null) {
      throw ArgumentError('Cannot specify both `key` and `compare` at the same time.');
    }

    assert(compare != null && key == null);
    return compare;
  }
  if (key == null) {
    return _get_direct_comparator<E>();
  } else {
    assert(compare == null && key != null);
    final keys_comparator = _get_direct_comparator<Object>();
    return (E a, E b) => keys_comparator(key(a), key(b));
  }
}

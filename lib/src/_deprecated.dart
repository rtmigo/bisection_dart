// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import '../bisection.dart';
import '_bisect_left_right.dart';

class ItemNotFoundError implements Exception {}

@Deprecated('Use List extension methods') // since 2021-11
void insortRight<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  var low = bisect_right<T>(a, x, lo: lo, hi: hi, compare: compare);
  a.insert(low, x);
}

@Deprecated('Use List extension methods') // since 2021-11
void insortLeft<T>(List<T> a, T x, {Comparator<T>? compare, int lo = 0, int? hi}) {
  var low = bisect_left<T>(a, x, lo: lo, hi: hi, compare: compare);
  a.insert(low, x);
}

@Deprecated('Use bisectRight') // since 2021-11
num bisectRightNum(List<num> A, num x, {int lo = 0, int? hi}) {
  // изначально здесь был код, имеющий дело с числами и операторами сравнения.
  // Этот код по-прежнему можно найти в версии 0.0.0 релиза в репозитории (2021-11-10).
  // Гипотетически он может быть полезен для создания ускоренной оптимизированной версии bisect.
  return bisect_right(A, x, lo: lo, hi: hi);
}

@Deprecated('Use bisectLeft') // since 2021-11
num bisectLeftNum(List<num> A, int x, {int lo = 0, int? hi}) {
  // изначально здесь был код, имеющий дело с числами и операторами сравнения.
  // Этот код по-прежнему можно найти в версии 0.0.0 релиза в репозитории (2021-11-10).
  // Гипотетически он может быть полезен для создания ускоренной оптимизированной версии bisect.
  return bisect_left(A, x, lo: lo, hi: hi);
}

/// Locate the leftmost value exactly equal to [x].
@Deprecated('Use List extension methods') // since 2021-11
int? indexOf<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisect_left<T>(a, x);
  if (i != a.length && a[i].compareTo(x) == 0) {
    return i;
  }

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate rightmost value less than [x].
@Deprecated('Use List extension methods') // since 2021-11
int? indexOfLT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisect_left(a, x);
  if (i != 0) {
    return i - 1;
  }

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate rightmost value less than or equal to [x].
@Deprecated('Use List extension methods') // since 2021-11
int? indexOfLE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisect_right(a, x);
  if (i != 0) return i - 1;

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate leftmost value greater than [x]
@Deprecated('Use List extension methods') // since 2021-11
int? indexOfGT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisect_right(a, x);
  if (i != a.length) return i;

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

/// Locate leftmost item greater than or equal to [x]
@Deprecated('Use List extension methods') // since 2021-11
int? indexOfGE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final i = bisect_left(a, x);
  if (i != a.length) return i;

  if (dontPanic) {
    return null;
  } else {
    throw ItemNotFoundError();
  }
}

@Deprecated('Use List extension methods') // since 2021-11
T? itemLT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfLT(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

@Deprecated('Use List extension methods') // since 2021-11
T? itemLE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfLE(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

@Deprecated('Use List extension methods') // since 2021-11
T? itemGT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfGT(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

@Deprecated('Use List extension methods') // since 2021-11
T? itemGE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfGE(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

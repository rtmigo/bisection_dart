// SPDX-FileCopyrightText: (c) 2019 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT


// the bisect source in Python:
// https://github.com/python/cpython/blob/3.6/Lib/bisect.py#L24

class ItemNotFoundError extends ArgumentError {

}

num bisectRightNum(List<num> A, num x, {int lo = 0, int? hi}) {
  // original java code (c) 2016 Profiterole (CC BY-SA 3.0) https://stackoverflow.com/a/39702057

  if (lo < 0) throw ArgumentError.value(lo, "lo");
  if (hi == null) hi = A.length;

  int N = A.length;
  if (N == 0) {
    return 0;
  }
  if (x < A[lo]) {
    return lo;
  }
  if (x > A[hi - 1]) {
    return hi;
  }
  for (;;) {
    if (lo + 1 == hi) {
      return lo + 1;
    }
    int mi = (hi! + lo) ~/ 2;
    if (x < A[mi]) {
      hi = mi;
    } else {
      lo = mi;
    }
  }
}

int bisectRight<T extends Comparable<T>>(List<T> A, T x, {int lo = 0, int? hi}) {
  // original java code (c) 2016 Profiterole (CC BY-SA 3.0) https://stackoverflow.com/a/39702057

  if (lo < 0) throw ArgumentError.value(lo, "lo");
  if (hi == null) hi = A.length;

  int N = A.length;
  if (N == 0) {
    return 0;
  }
  if (x.compareTo(A[lo]) < 0) {
    return lo;
  }
  if (x.compareTo(A[hi - 1]) > 0) {
    return hi;
  }
  for (;;) {
    if (lo + 1 == hi) {
      return lo + 1;
    }
    int mi = (hi! + lo) ~/ 2;
    if (x.compareTo(A[mi]) < 0) {
      hi = mi;
    } else {
      lo = mi;
    }
  }
}

num bisectLeftNum(List<num> A, int x, {int lo = 0, int? hi}) {
  // original java code (c) 2016 Profiterole (CC BY-SA 3.0) https://stackoverflow.com/a/39702057

  if (lo < 0) throw ArgumentError.value(lo, "lo");
  if (hi == null) hi = A.length;

  int N = A.length;
  if (N == 0) {
    return 0;
  }
  if (x < A[lo]) {
    return lo;
  }
  if (x > A[hi - 1]) {
    return hi;
  }
  for (;;) {
    if (lo + 1 == hi) {
      return x == A[lo] ? lo : (lo + 1);
    }
    int mi = (hi! + lo) ~/ 2;
    if (x <= A[mi]) {
      hi = mi;
    } else {
      lo = mi;
    }
  }
}

int bisectLeft<T extends Comparable<T>>(List<T> A, T x, {int lo = 0, int? hi}) {
  // original java code (c) 2016 Profiterole (CC BY-SA 3.0) https://stackoverflow.com/a/39702057

  //if (lo == null) lo = 0;
  if (lo < 0) throw ArgumentError.value(lo, "lo");
  if (hi == null) hi = A.length;

  int N = A.length;
  if (N == 0) {
    return 0;
  }
  if (x.compareTo(A[lo]) < 0) {
    return lo;
  }
  if (x.compareTo(A[hi - 1]) > 0) {
    return hi;
  }
  for (;;) {
    if (lo + 1 == hi) {
      return x == A[lo] ? lo : (lo + 1);
    }
    int mi = (hi! + lo) ~/ 2;
    if (x.compareTo(A[mi]) <= 0) {
      hi = mi;
    } else {
      lo = mi;
    }
  }
}

int? indexOf<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  // Locate the leftmost value exactly equal to x
  final i = bisectLeft<T>(a, x);
  if (i != a.length && a[i].compareTo(x) == 0) return i;

  if (dontPanic)
    return null;
  else
    throw ArgumentError();
}

int? indexOfLT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  // Find rightmost value less than x'
  final i = bisectLeft(a, x);
  if (i != 0) return i - 1;

  if (dontPanic)
    return null;
  else
    throw ArgumentError();
}

int? indexOfLE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  // Find rightmost value less than or equal to x'
  final i = bisectRight(a, x);
  if (i != 0) return i - 1;

  if (dontPanic)
    return null;
  else
    throw ArgumentError();
}

int? indexOfGT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  // Find leftmost value greater than x'
  final i = bisectRight(a, x);
  if (i != a.length) return i;

  if (dontPanic)
    return null;
  else
    throw ArgumentError();
}

int? indexOfGE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  // Find leftmost item greater than or equal to x'
  final i = bisectLeft(a, x);
  if (i != a.length) return i;

  if (dontPanic)
    return null;
  else
    throw ArgumentError();
}

T? itemLT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfLT(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

T? itemLE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfLE(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

T? itemGT<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfGT(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

T? itemGE<T extends Comparable<T>>(List<T> a, T x, {bool dontPanic = false}) {
  final index = indexOfGE(a, x, dontPanic: dontPanic);
  return index == null ? null : a[index];
}

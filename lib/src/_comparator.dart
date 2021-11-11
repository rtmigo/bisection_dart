/// Compares two items dynamically interpreting them as [Comparable<T>].
int _compare_as_comparables<T>(T a, T b) {
  return (a as Comparable<T>).compareTo(b);
}

int _compare_num(num a, num b) {
  return a.compareTo(b);
}

Comparator<T> get_comparator<T>() {
  if (T == int || T == double) {
    // in Dart 2.14 we would get an exception if we tried to convert a variable of type
    // `int` directly to `Comparable<int>`. But if we assign the value to num, it is a comparable.
    // TODO benchmark speed: maybe the speed will be higher without num at all
    return _compare_num as Comparator<T>;
  }
  return _compare_as_comparables;
}
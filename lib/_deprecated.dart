import 'beesect.dart';



@Deprecated('Use bisectRight') // since 2021-11
num bisectRightNum(List<num> A, num x, {int lo = 0, int? hi}) {
  return bisectRight(A, x, lo: lo, hi: hi);
}

@Deprecated('Use bisectLeft') // since 2021-11
num bisectLeftNum(List<num> A, int x, {int lo = 0, int? hi}) {
  // изначально здесь был код, имеющий дело с числами и операторами сравнения.
  // Этот код по-прежнему можно найти в версии 0.0.0 релиза в репозитории (2021-11-10).
  // Гипотетически он может быть полезен для создания ускоренной оптимизированной версии bisect.
  return bisectLeft(A, x, lo:lo, hi:hi);
}
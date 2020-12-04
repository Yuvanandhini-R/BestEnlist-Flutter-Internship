import 'dart:math';

class RandomNumberGenerator {
  Random _random = Random();

  RandomNumberGenerator._privateConstructor();

  static final RandomNumberGenerator _instance =
      RandomNumberGenerator._privateConstructor();

  factory RandomNumberGenerator() {
    return _instance;
  }

  int generateRandomNumber(int start, int end) {
    return _random.nextInt(end + 1 - start) + start;
  }

  int generateRandomNumberUpto100() {
    return _random.nextInt(100) + 1;
  }
}

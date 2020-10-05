import 'package:flutter_test/flutter_test.dart';
import 'package:nrandom/nrandom.dart';

void main() {

  test('Test init', () {
    // Arrange
    final NRandom nrandom = NRandom(1);

    // Act
    // do nothing

    // Assert
    expect(nrandom, isNotNull);
    expect(nrandom.probabilities, isNotNull);
    expect(nrandom.probabilities.length, 1);
  });

  test('Test init with length is zero', () {
    // Arrange
    final NRandom nrandom = NRandom(0);

    // Act
    final index = nrandom.getNextIndex();

    // Assert
    expect(index, -1);
  });

  test('Test init with new length', () {
    // Arrange
    final NRandom nrandom = NRandom(1);

    // Act
    nrandom.init(2);

    // Assert
    expect(nrandom.probabilities.length, 2);
  });

  test('Test probabilities update after random index', () {
    // Arrange
    final int length = 5;
    final NRandom nrandom = NRandom(length);

    // Act
    final int index = nrandom.getNextIndex();

    // Assert
    for (int i = 0; i < length; i++) {
      final double p = nrandom.probabilities[i];
      if (i == index) {
        expect(p, 4);
      } else {
        expect(p, 24);
      }
    }
  });
}

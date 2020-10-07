import 'package:flutter_test/flutter_test.dart';
import 'package:nrandom/nrandom.dart';

void main() {
  test('Test init', () {
    // Arrange
    final NRandom nrandom = NRandom(1);

    // Act
    final int index = nrandom.getNextIndex();

    // Assert
    expect(nrandom, isNotNull);
    expect(nrandom.probabilities, isNotNull);
    expect(nrandom.probabilities[0], 100);
    expect(nrandom.probabilities.length, 1);
    expect(index, 0);
  });

  test('Test init with decrease factor', () {
    // Arrange
    final int length = 2;
    final int factor = 4;
    final NRandom nrandom = NRandom(length, factor);

    // Act
    final int index = nrandom.getNextIndex();

    // Assert
    expect(nrandom.probabilities[index], 100 / length / factor);
  });

  test('Test init with custom probabilities', () {
    // Arrange
    final int length = 2;
    final int factor = 4;
    final List<double> probabilities = [0.7, 0.3];
    final NRandom nrandom = NRandom(length, factor, probabilities);

    // Assert
    expect(nrandom.probabilities[0], probabilities[0]);
    expect(nrandom.probabilities[1], probabilities[1]);
  });

  test('Test init with zero decrease factor', () {
    // Assert
    expect(() => NRandom(0), throwsArgumentError);
    expect(() => NRandom(1).init(0), throwsArgumentError);
  });

  test('Test init with factor is zero', () {
    // Arrange
    final int length = 2;
    final int factor = 0;
    final NRandom nrandom = NRandom(length, factor);

    // Act
    final int index = nrandom.getNextIndex();

    // Assert
    expect(nrandom.probabilities[index], 0);
    expect(nrandom.probabilities[index == 0 ? 1 : 0], 100);
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

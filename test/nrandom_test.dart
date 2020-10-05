import 'package:flutter_test/flutter_test.dart';
import 'package:nrandom/nrandom.dart';

void main() {
  test('Test probabilities update after random index', () {
    // Arrange
    final int length = 5;
    final NRandom nrandom = NRandom(length);

    // Act
    final int index = nrandom.getNextIndex();

    // Assert
    expect(index, isNotNull);

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

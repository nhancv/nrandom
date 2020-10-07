import 'dart:math';

/// Return random number with probability
/// Ex: length = 5
/// 1 2 3 4 5 => default probability = 100 / length = 20% each number
/// If choose 1
/// => probability of number 1 will DECREASE A HALF (changeable) -> from 20% to 10%
/// => 10% from number 1 will increase all the remaining 4 numbers
/// 1    2      3      4      5
/// 10%  22.5%  22.5%  22.5%  22.5%
/// Continue, next random is number 3
/// 1       2       3       4       5
/// 13.75%  26.25%  11.25%  26.25%  26.25%
///
class NRandom {
  NRandom(this._length,
      [this._decreaseFactor = 5, List<double> probabilities]) {
    if (_length > 0) {
      final double probability = 100 / _length;
      if (probabilities == null) {
        this.probabilities = List<double>.filled(_length, probability);
      } else {
        this.probabilities = probabilities;
      }
    } else {
      throw ArgumentError('length must > 0');
    }
  }

  // Length of index array
  int _length;

  // A factor to update _probabilities after generate new index
  // Default = 5 (decrease 100/5 = 20%)
  int _decreaseFactor;

  /// Probabilities of index array
  List<double> probabilities;

  /// Init with new length and factor
  void init(int length, [int decreaseFactor = 5, List<double> probabilities]) {
    if (length > 0) {
      this._length = length;
      this._decreaseFactor = decreaseFactor;
      final double probability = 100 / _length;
      if (probabilities == null) {
        this.probabilities = List<double>.filled(_length, probability);
      } else {
        this.probabilities = probabilities;
      }
    } else {
      throw ArgumentError('length must > 0');
    }
  }

  /// Return random index
  int getNextIndex() {
    if (_length == 0) {
      return -1;
    } else if (_length == 1) {
      return 0;
    }

    final double r = Random().nextDouble();

    /// Find index
    double s = 0;
    int index = 0;
    for (int i = 0; i < _length; i++) {
      final double p = probabilities[i] / 100;
      if (r >= s && r < (s + p)) {
        index = i;
        break;
      }
      s += p;
    }

    /// Update probabilities;
    /// Decrease probability of index number
    final double x =
        _decreaseFactor == 0 ? 0 : (probabilities[index] / _decreaseFactor);

    /// Increase probability of all remaining numbers
    final double y = (probabilities[index] - x) / (_length - 1);
    for (int i = 0; i < _length; i++) {
      if (i == index) {
        probabilities[i] = x;
      } else {
        probabilities[i] += y;
      }
    }
    return index;
  }
}

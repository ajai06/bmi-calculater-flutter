

import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;

  double _bmi = 0;

  String calculateBMI () {
     _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult () {
    if(_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInfo () {
    if(_bmi >= 25) {
      return 'You have a higher than normal body wight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body wight. Good job';
    } else {
      return 'You have a lower than normal body wight. You can eat a bit more';
    }
  }
}
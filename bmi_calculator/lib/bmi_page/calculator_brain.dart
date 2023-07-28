import 'dart:math';

class CalculatorBrain{

  double _bmi = 0.0;

  final int height;
  final int weight;


  CalculatorBrain({required this.height, required this.weight}){
    _bmi=weight/ pow(height/100, 2);
  }

  String calculateBmi(){
    this._bmi = (weight/ pow(height/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >=25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >=25){
      return 'Dagadt dilóm, nem kellett volna az a csoki..';
    }else if(_bmi>18.5){
      return 'Minden fasza';
    }else {
      return 'Egyél valamit mert elfúj a szél te girhes fasz';
    }
  }

}
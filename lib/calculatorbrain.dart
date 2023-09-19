import'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});
  final int? height;
  final int? weight;
  double? _bmi;
  String calculateBMI(){
    _bmi =weight! / pow(height! / 100,2);
    return _bmi!.toStringAsFixed(1);} // single decimal pt

  String getResult(){
    if(_bmi!>=24){
      return 'overweight';
    }
    else if(_bmi!>18.5){
      return 'Normal';
    }
    else{
      return 'underweight';
    }
  }
  String getInterpretation(){
    if(_bmi!>=24){
      return 'you have higher than normal body weight, try to exercise more';
    }
    else if(_bmi!>18.5){
      return 'you have a normal body weight good job';
    }
    else{
      return 'you have a lower than normal body weight.you can eat bit more nutritious food';
    }
  }



}
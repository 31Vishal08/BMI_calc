import 'package:bmi_main/components/screens/resultspage.dart';
import 'package:flutter/material.dart';
import'package:bmi_main/components/screens/inputpage.dart';
import'package:bmi_main/constants.dart';
import'package:bmi_main/components/reusable_card.dart';
import'package:bmi_main/components/BottomButton.dart';
import'package:bmi_main/components/screens/resultspage.dart';
class ResultPage extends StatelessWidget {

  ResultPage({@required this.interpretation,@required this.bmiResult,@required this.resultText});

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('BMI Calculator'),
        ),

        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Expanded(child: Container(
              padding:EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style:kTitleTextStyle,
              ),
            ),),
            Expanded(
              flex:5,
              child:reusablecard(
                colour:kactiveAllColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                    Text(
                        resultText!.toUpperCase(),
                        style:kresultTextStyle),
                    Text(
                      bmiResult!,
                      style:kBMITextStyle,
                    ),
                    Text(
                      interpretation!,
                      style:kBodyTextStyle,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(onTap: (){
              Navigator.pop(context);
            }, buttonTitle: 'RE-CALCULATE')
          ],
        )
    );

  }
}
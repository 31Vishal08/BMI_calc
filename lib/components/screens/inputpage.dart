import 'package:bmi_main/constants.dart';
import 'package:bmi_main/components/screens/resultspage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_main/components/iconContent.dart';
import 'package:bmi_main/components/reusable_card.dart';
import 'package:bmi_main/components/BottomButton.dart';
import 'package:bmi_main/components/RoundButton.dart';
import'package:bmi_main/calculatorbrain.dart';

const double bottomContainerHeight = 80;
const activeAllColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const inactiveCardColor = Color(0xFF111328);

enum GenderType {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Male;
                      });
                    },
                    colour: selectedGender == GenderType.Male ? activeAllColor : inactiveCardColor,
                    childCard: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: reusablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Female;
                      });
                    },
                    colour: selectedGender == GenderType.Female
                        ? activeAllColor
                        : inactiveCardColor,
                    childCard:
                    iconContent(icon: FontAwesomeIcons.venus, label: 'Female'),
                  ),
                ),
              ])),
          Expanded(
            child: reusablecard(
              colour: activeAllColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.pink,
                      overlayColor: Color(0x29EB15555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220, //left //right
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(

            child: Row(children: <Widget>[
              Expanded(
                child: reusablecard(
                  colour: kactiveAllColor,
                  childCard: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIConButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    print('w--');
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIConButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: reusablecard(
                    colour: kactiveAllColor,
                    childCard: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: klabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIConButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(width: 10),
                                RoundIConButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ))),
              )
            ]),
          ),
          BottomButton(
              onTap: (){

                CalculatorBrain calc =CalculatorBrain(height:height,weight: weight);

                Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),),);
              }, buttonTitle: 'calculate'),
          // GestureDetector(
          //      onTap: (){
          //        Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultPage(),),);
          //      },
          //   child:Container(
          //     child:Center(
          //       child:Text(
          //         'CALCULATE',
          //         style: kLargeButtonTextStyle,
          //       ),
          //     ),
          //     color:kbottomContainerColor,
          //     margin:EdgeInsets.only(top:10),
          //     padding:EdgeInsets.only(bottom:20),
          //     width:double.infinity,
          //     height: kbottomContainerHeight,
          //   ),
          //      ),
        ],
      ),
    );
  }
}

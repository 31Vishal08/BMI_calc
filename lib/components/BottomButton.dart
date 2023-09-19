import 'package:flutter/material.dart';
import'package:bmi_main/constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonTitle});
  final Function? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap!(); },
      child: GestureDetector(

        child: Container(
          padding:EdgeInsets.all(25),
          alignment: Alignment.center,
          child: Text(
              buttonTitle!,
              style: kLargeButtonTextStyle),
          color: kbottomContainerColor,
          margin: EdgeInsets.only(top: 10),

          width: double.infinity,
          height: kbottomContainerHeight,
        ),
      ),
    );
  }
}
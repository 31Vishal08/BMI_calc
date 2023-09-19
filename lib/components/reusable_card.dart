import 'package:flutter/material.dart';

class reusablecard extends StatelessWidget {
  reusablecard({@required this.colour, this.childCard,this.onPress});
  final Color? colour;
  final Widget? childCard;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
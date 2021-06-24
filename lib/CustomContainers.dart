import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/Const.dart';
import 'CustomText.dart';

class CustomButtomContainer extends StatelessWidget {
  final String text;
  final Function onTap;

  CustomButtomContainer({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kBottomContainerBackgroundColour,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class CustomContainers extends StatelessWidget {
  final Color colour;
  final Function onTap;
  final Widget top;
  final Widget middle;

  final Widget bottom;

  CustomContainers({
    @required this.colour,
    @required this.onTap,
    this.top,
    this.middle,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: top),
            Container(
              child: middle,
            ),
            Container(child: bottom),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/Const.dart';

class CustomRoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function function;

  CustomRoundIconButton({@required this.icon, @required this.function});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 40,
      ),
      onPressed: function,
      fillColor: kButtonBackgroundColor,
      shape: CircleBorder(),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
    );
  }
}

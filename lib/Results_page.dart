import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CustomText.dart';
import 'CustomContainers.dart';
import 'package:bmi_calculator/Const.dart';
import 'Calculation.dart';
import 'Input_page.dart';

class Result extends StatelessWidget {
  final String bmi;
  final String comment;
  final String status;
  final String range;

  Result({this.status, this.bmi, this.comment, this.range});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 8),
              child: CustomText(
                text: "Your Result",
                fontSize: 40,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: kInactiveBackgroundColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        status,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(text: bmi, fontSize: 130),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          status + " IBM range:",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CustomText(text: range + " kg/m2", fontSize: 25),
                      SizedBox(
                        height: 60,
                      ),
                      CustomText(
                          text: "You Have " + status + " Body Weight.",
                          fontSize: 20),
                      CustomText(text: comment, fontSize: 20),
                    ],
                  ),
                ),
              ),
            ),
            CustomButtomContainer(
              text: "RE- CALCULATE YOUR IBM",
              onTap: () {
                Navigator.pop(context, "/Screen1");
              },
            )
          ],
        ),
      ),
    );
  }
}

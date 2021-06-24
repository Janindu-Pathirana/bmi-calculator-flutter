import 'package:bmi_calculator/Calculation.dart';
import 'package:bmi_calculator/Results_page.dart';
import 'package:flutter/material.dart';
import 'CustomText.dart';
import 'CustomContainers.dart';

import 'package:bmi_calculator/Const.dart';
import 'CustomRoundIconButton.dart';
import 'Results_page.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { Male, Female, NotSelected }

enum Valuve { Add, Remove }

enum Action { Weight, Age }

Gender gender = Gender.NotSelected;
int height = 30;
int weight = 5;
int age = 18;

int maxWeight = 250;
int minWeight = 5;

int maxAge = 100;
int minAge = 1;

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveBackgroundColour;
  Color femaleCardColor = kInactiveBackgroundColour;

  butons(Action action, Function function) {
    function(action);

    action == Action.Age
        ? age = validator(age, minAge, maxAge)
        : weight = validator(weight, minWeight, maxWeight);
  }

  void alert() {
    print("alert");

    Alert(
      context: context,
      type: AlertType.error,
      title: "Gender Not Selected",
      desc: "Select your gender",
      style: AlertStyle(
        backgroundColor: Color(0x4DA5A4A4),
        descStyle: TextStyle(color: Colors.white),
        titleStyle: TextStyle(color: Colors.white),
      ),
      buttons: [
        DialogButton(
          child: Text(
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void add(Action action) {
    action == Action.Age ? age++ : weight++;
  }

  void remove(Action action) {
    action == Action.Age ? age-- : weight--;
  }

  int validator(int val, int min, int max) {
    val == min - 1
        ? val = min
        : val == max
            ? val = max
            : print("pass");

    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainers(
                        onTap: () {
                          print("Male");

                          setState(() {
                            gender = Gender.Male;
                          });
                        },
                        colour: gender == Gender.Male
                            ? kActiveBackgroundColour
                            : kInactiveBackgroundColour,
                        middle: Icon(
                          Icons.male,
                          size: 100,
                        ),
                        bottom: CustomText(
                          text: "MALE",
                          fontSize: 25,
                        )),
                  ),
                  Expanded(
                    child: CustomContainers(
                      onTap: () {
                        print("Female");

                        setState(() {
                          gender = Gender.Female;
                        });
                      },
                      colour: gender == Gender.Female
                          ? kActiveBackgroundColour
                          : kInactiveBackgroundColour,
                      middle: Icon(
                        Icons.female,
                        size: 100,
                      ),
                      bottom: CustomText(
                        fontSize: 25,
                        text: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomContainers(
                colour: kInactiveBackgroundColour,
                top: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CustomText(
                    text: "HEIGHT",
                    fontSize: 25,
                  ),
                ),
                middle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    CustomText(text: height.toString(), fontSize: 60),
                    CustomText(text: "cm", fontSize: 20)
                  ],
                ),
                bottom: Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kButtonBackgroundColor,
                        thumbColor: kBottomContainerBackgroundColour,
                        trackHeight: 2,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayColor: Color(0x29E91E63),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 26)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 30.0,
                      max: 200.0,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainers(
                      colour: kInactiveBackgroundColour,
                      top: CustomText(
                        text: "WEIGHT",
                        fontSize: 25,
                      ),
                      middle: CustomText(
                        text: "$weight",
                        fontSize: 60,
                      ),
                      bottom: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomRoundIconButton(
                            icon: Icons.remove,
                            function: () {
                              setState(() {
                                weight >= minWeight || weight <= maxWeight
                                    ? butons(Action.Weight, remove)
                                    : print("Weight remove");
                              });
                            },
                          ),
                          CustomRoundIconButton(
                            icon: Icons.add,
                            function: () {
                              setState(() {
                                weight >= minWeight || age <= maxWeight
                                    ? butons(Action.Weight, add)
                                    : print("Weight add");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainers(
                      colour: kInactiveBackgroundColour,
                      top: CustomText(
                        text: "AGE",
                        fontSize: 25,
                      ),
                      middle: CustomText(
                        text: "$age",
                        fontSize: 60,
                      ),
                      bottom: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomRoundIconButton(
                            icon: Icons.remove,
                            function: () {
                              setState(() {
                                age >= minAge || age <= maxAge
                                    ? butons(Action.Age, remove)
                                    : print("Age Remove");
                              });
                            },
                          ),
                          CustomRoundIconButton(
                            icon: Icons.add,
                            function: () {
                              setState(() {
                                age >= minAge || age <= maxAge
                                    ? butons(Action.Age, add)
                                    : print("Age Add");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButtomContainer(
              text: "Calculate Your IBM",
              onTap: () {
                if (!(gender == Gender.NotSelected)) {
                  print("Next page");
                  Calculation cal = Calculation(weight, height);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        bmi: cal.ibmCalculator(),
                        status: cal.statusCalculator(),
                        comment: cal.comment,
                        range: cal.range,
                      ),
                    ),
                  );
                } else {
                  alert();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

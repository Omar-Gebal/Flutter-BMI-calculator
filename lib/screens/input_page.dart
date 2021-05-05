import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/IconContent.dart';
import '../components/ReusableCard.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import '../calculator_brain.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildGenderWidget(),
            buildHeightWidget(context),
            buildWeightAndAgeWidget(),
            buildButtonWidget(context),
          ],
        ),
      ),
    );
  }

  BottomButton buildButtonWidget(BuildContext context) {
    return BottomButton(
      buttonTitle: 'CALCULATE',
      onTap: () {
        CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              meaningText: calc.getMeaning(),
            ),
          ),
        );
      },
    );
  }

  Expanded buildWeightAndAgeWidget() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              colour: kActiveCardsColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kCardTextStyle,
                  ),
                  Text(
                    '$weight',
                    style: kNumbersTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RoundButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardsColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AGE',
                    style: kCardTextStyle,
                  ),
                  Text(
                    '$age',
                    style: kNumbersTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RoundButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildHeightWidget(BuildContext context) {
    return Expanded(
      child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kCardTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '$height',
                    style: kNumbersTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kCardTextStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    overlayColor: Color(0x29EB1555)),
                child: Slider(
                  value: height.toDouble(),
                  min: 100,
                  max: 300,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              )
            ],
          ),
          colour: kActiveCardsColor),
    );
  }

  Expanded buildGenderWidget() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.Male;
                });
              },
              cardChild: IconContent(
                cardText: 'MALE',
                cardIcon: FontAwesomeIcons.mars,
              ),
              colour: selectedGender == Gender.Male
                  ? kActiveCardsColor
                  : kInactiveCardsColor,
            ),
          ),
          Expanded(
            child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.Female;
                  });
                },
                cardChild: IconContent(
                  cardText: 'FEMALE',
                  cardIcon: FontAwesomeIcons.venus,
                ),
                colour: selectedGender == Gender.Female
                    ? kActiveCardsColor
                    : kInactiveCardsColor),
          ),
        ],
      ),
    );
  }
}

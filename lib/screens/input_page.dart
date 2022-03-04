import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_page.dart';

import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon.dart';
import '../components/bottom_button.dart';

import '../calculate_brain.dart';

const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

enum Gender { male, female, unSepecified }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  late Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 50;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                    childCard: IconContent(
                        text: 'Male', iconName: FontAwesomeIcons.mars)),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
                    childCard: IconContent(
                      text: 'Female',
                      iconName: FontAwesomeIcons.venus,
                    )),
              )
            ],
          )),

          Expanded(
            child: ReusableCard(
              onPress: (){},
              colour: inActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                        Text(height.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900
                        ),),
                      const Text('cm',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98)
                      )
                      ),
                    ]
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: const Color(0x15EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30
                      )
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 400,
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){},
                    colour: inActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text("Weight",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98)
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }

                            ),
                            const SizedBox(width: 20),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                      onPress: (){},
                      colour: inActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Age",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98)
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }),
                              const SizedBox(width: 20,),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc =  CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                info: calc.getInfo(),
              )));
            },
          )
        ],
      ),
    );
  }
}






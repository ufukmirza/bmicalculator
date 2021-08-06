import 'package:bmicalculator/model/CalculatorBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MyBmiResultPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sliderValue = 40.0;
  var weight = 40;
  var age = 20;
  Color? MaleColor;
  bool isMale = false;
  bool isFemale = false;
  Color? FemaleColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      FemaleColor = null;
                      MaleColor = Colors.black54;
                      isMale = true;
                      isFemale = false;
                    });
                  },
                  child: getContainer(
                    color: MaleColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      MaleColor = null;
                      FemaleColor = Colors.black54;
                      isMale = false;
                      isFemale = true;
                    });
                  },
                  child: getContainer(
                    color: FemaleColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            )),
            Expanded(
                child: getContainer(
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${sliderValue.toInt()}',
                        style: TextStyle(fontSize: 40),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'cm',
                            style: TextStyle(
                                fontSize: 31,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                        ]),
                  ),
                  Slider(
                    activeColor: Colors.deepPurple,
                    inactiveColor: Colors.white,
                    min: 0,
                    max: 250,
                    value: sliderValue,
                    onChanged: (double newValue) {
                      setState(() {
                        sliderValue = newValue;
                      });
                    },
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: getContainer(
                  childwidget: Column(
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                      ),
                      Text(
                        "$weight",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Row(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            focusColor: Colors.black,
                            elevation: 2.0,
                            fillColor: Colors.black,
                            highlightColor: Colors.black,
                            child: Icon(
                              FontAwesomeIcons.minus,
                              size: 35.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          RawMaterialButton(
                            focusColor: Colors.black,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            elevation: 2.0,
                            fillColor: Colors.black,
                            highlightColor: Colors.black,
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 35.0,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: getContainer(
                  childwidget: Column(
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                      ),
                      Text(
                        "$age",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Row(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            focusColor: Colors.black,
                            elevation: 2.0,
                            fillColor: Colors.black,
                            highlightColor: Colors.black,
                            child: Icon(
                              FontAwesomeIcons.minus,
                              size: 35.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          RawMaterialButton(
                            focusColor: Colors.black,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            elevation: 2.0,
                            fillColor: Colors.black,
                            highlightColor: Colors.black,
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 35.0,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            Container(
              color: Colors.pink,
              height: 40,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  CalculatorBrain calc =
                  CalculatorBrain(height: sliderValue.toInt(), weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyBmiResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Calculate Your BMI',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class getContainer extends StatelessWidget {
  Widget? childwidget;
  Color? color;

  getContainer({this.childwidget, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color == null ? Color(0xFF1D1E33) : color,
          borderRadius: BorderRadius.circular(15.0)),
      child: childwidget == null ? null : childwidget,
    );
  }
}

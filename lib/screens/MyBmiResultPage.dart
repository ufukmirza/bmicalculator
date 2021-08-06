import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MyBmiResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;


  MyBmiResultPage(
      {required this.interpretation,
        required this.bmiResult,
        required this.resultText});



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                color: Color(0xFF1D1E33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

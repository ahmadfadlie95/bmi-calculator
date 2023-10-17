import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  int _bmi = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(color: Colors.blue, fontSize: 32),
            ),
            SizedBox(height: 8),
            Text(
              "We care about your health",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            SizedBox(height: 8),
            Image.network(
                "https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
            SizedBox(height: 8),
            Text(
              "Height: ${_heightSliderValue.round()}cm",
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _heightSliderValue,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            SizedBox(height: 8),
            Text(
              "Weight: ${_weightSliderValue.round()}kg",
              style: TextStyle(fontSize: 18),
            ),
            Slider(
                value: _weightSliderValue,
                max: 150,
                onChanged: (double value) {
                  setState(() {
                    _weightSliderValue = value;
                  });
                }),
            SizedBox(height: 8),
            _bmi != 0 ?  Text("Your BMI is $_bmi") : SizedBox(),
            Text(_message),
            TextButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.red), // Set the background color to red
                ),
                onPressed: () {
                  var bmiTemp = _weightSliderValue/pow((_heightSliderValue/100),2);
                  print(bmiTemp);
                  var messageTemp = "";
                  if(bmiTemp < 18){
                    messageTemp = "You are underweight";
                  } else if(bmiTemp < 25){
                    messageTemp = "You are normal weight";
                  } else if(bmiTemp < 30){
                    messageTemp = "You are overweight";
                  } else{
                    messageTemp = "You are obese";
                  }
                  // This is to assign bmiTemp into _bmi and refresh the ui.
                  setState(() {
                    _bmi = bmiTemp.round();
                    _message = messageTemp;
                  });
                },
                icon: Icon(Icons.favorite),
                label: Text("Calculate BMI"))
          ],
        ),
      ),
    );
  }
}

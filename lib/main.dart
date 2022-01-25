import 'dart:math';

import 'package:bmicalculator/CardMeasure.dart';
import 'package:bmicalculator/IconContent.dart';
import 'package:flutter/material.dart';
import 'colorTheme.dart';
import 'package:bmicalculator/CardGender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedGender = 1;
  int weight = 55;
  int height = 153;
  String statusBMI = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsTheme.primaryColor,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: ColorsTheme.secondaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CardGender(
                  cardChild: IconContent(
                      icon: Icons.male,
                      title: 'Female',
                      active: selectedGender == 0),
                  onPress: () {
                    setState(() {
                      selectedGender = 0;
                    });
                  }),
              CardGender(
                  cardChild: IconContent(
                      icon: Icons.male,
                      title: 'Male',
                      active: selectedGender == 1),
                  onPress: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  })
            ]),
            Row(children: [
              CardGender(
                  cardChild: CardMeasure(
                      measure: weight,
                      title: 'Weight',
                      unit: 'Kg',
                      enabled: weight < 0 ? false : true,
                      increment: () {
                        setState(() {
                          weight++;
                        });
                        print('increment $weight');
                      },
                      decrement: () {
                        if (weight > 0) {
                          setState(() {
                            weight--;
                          });
                        }
                        print('decrement $weight');
                      }),
                  onPress: () {}),
              CardGender(
                  cardChild: CardMeasure(
                      measure: height,
                      title: 'Height',
                      unit: 'cm',
                      enabled: height < 0 ? false : true,
                      increment: () {
                        setState(() {
                          height++;
                        });
                        print('increment $height');
                      },
                      decrement: () {
                        if (height > 0) {
                          setState(() {
                            height--;
                          });
                        }
                        print('decrement $height');
                      }),
                  onPress: () {}),
            ]),
            GestureDetector(
              onTap: () {
                double bmi = weight / pow(height / 100, 2);
                String bmiString = bmi.toStringAsFixed(2);
                if (bmi < 18.5) {
                  setState(() {
                    statusBMI = 'Underweight';
                  });
                } else if (bmi >= 18.5 && bmi <= 24.9) {
                  statusBMI =  'Normal/Healthy';
                } else if (bmi > 24.9){
                  statusBMI =  'Overweight';
                }
                print(bmiString);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Your BMI is $bmiString, your status is $statusBMI',
                          style: const TextStyle(fontSize: 25),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back'))
                        ],
                      );
                    });
              },
              child: Container(
                color: ColorsTheme.thirdColor,
                width: double.infinity,
                height: 60,
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

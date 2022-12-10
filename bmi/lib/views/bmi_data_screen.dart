import 'dart:math';

import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  double calculateBMI() {
    double heightInMeter = height / 100;

    double bmi = weight / pow(heightInMeter, 2);

    return bmi;
  }

  List<Widget> generteList(int start, int end) {
    List<Widget> weight = [];
    for (int i = start; i < end; i++) {
      weight.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }

    return weight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Center(child:  Text("BMI Calculator")),
        elevation: 0,
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BMICalculator(height: height, weight: weight);

          bmiCalculator.calculateBMI();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff517df6),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 60,
          margin: EdgeInsets.all(15),
          child: const Center(
            child: Text(
              "Hitung BMI",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BMICard(
                      borderColor:
                          (gender == "male") ? Color(0xff517df6) : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: GenderIconText(
                                icon: Icons.male,
                                title: "Male",
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "male")
                                  ? const Color(0xff517df6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BMICard(
                      borderColor:
                          (gender == "female") ? Color(0xff517df6) : Colors.white,
                      child:  Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: GenderIconText(
                                icon: Icons.female,
                                title: 'Female',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "female")
                                  ? const Color(0xff517df6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height:15),
            Column(
              children: [
                Text(
                  "Height",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BMICard(
                        child: Slider(
                          value: height.toDouble(),
                          min: 80,
                          max: 200,
                          activeColor: Colors.white,
                          thumbColor: Colors.pink,
                          onChanged: (value) {
                            height = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    BMICard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$height",
                              style: labelTextStyle,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "cm",
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height:15),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Weight",
                          style: labelTextStyle,
                        ),
                        BMICard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 30),
                                  itemExtent: 25,
                                  magnification: 1.7,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (val) {
                                    print(val);
                                    weight = val + 20;
                                  },
                                  children: generteList(20, 220),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Age",
                          style: labelTextStyle,
                        ),
                        BMICard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: CupertinoPicker(
                                  scrollController:
                                      FixedExtentScrollController(initialItem: 5),
                                  itemExtent: 25,
                                  magnification: 1.7,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (val) {
                                    print(val);
                                    age = val + 20;
                                  },
                                  children: generteList(15, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(-2,2),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2)
          )
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: primaryColor,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
    //  required this.bmi_calculator
  }) : super(key: key);

  final double bmi;
  // final BMICalculator? bmi_calculator;

  @override
  Widget build(BuildContext context) {
    final BMICalculator bmiCalculator = BMICalculator.fromBMIValue(bmi);
    bmiCalculator.determineBMICategory();
    bmiCalculator.getHealtRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
        iconTheme: const IconThemeData(
          color: primaryColor, //change your color here
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Result",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: BMICard(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            bmiCalculator.bmiCategory ?? "",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            bmi.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            bmiCalculator.bmiDescription ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff517df6),
              ),
              height: 60,
              child: const Center(
                child: Text(
                  "Recalculate BMI",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

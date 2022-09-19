import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);

  final double bmi;

  determineBMICategory(double bmiScore) {
    String category = "";

    if (bmiScore < 16.0) {
      category = underWeightSevere;
    } else if (16.0 <= bmiScore && bmiScore < 17.0) {
      category = underWeightModerate;
    } else if (17.0 <= bmiScore && bmiScore < 18.5) {
      category = underWeightMild;
    } else if (18.5 <= bmiScore && bmiScore < 25.0) {
      category = normal;
    } else if (25.0 <= bmiScore && bmiScore < 30.0) {
      category = overweight;
    } else if (30.0 <= bmiScore && bmiScore < 35.0) {
      category = obes1;
    } else if (35.0 <= bmiScore && bmiScore < 40.0) {
      category = obes2;
    } else if (40.0 <= bmiScore) {
      category = obes3;
    }

    return category;
  }

  getHealtRiskDescription(String category) {
    String desc = "";
    switch (category) {
      case underWeightSevere:
      case underWeightModerate:
      case underWeightMild:
        desc = "posible nutritioal deficiency and osteoporosis";
        break;
      case normal:
        desc = "good health ...";
        break;

      case overweight:
        desc =
            "moderate risk of developement heart dissease, high blod pressure";
        break;

      case obes1:
      case obes2:
      case obes3:
        desc = "high risk of developement heart dissease, high blod pressure";
        break;
    }

    return desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Hitung BMI")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: const Center(
                child: Text(
                  "Result",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BMICard(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      determineBMICategory(bmi),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      getHealtRiskDescription(determineBMICategory(bmi)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffec3c66),
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

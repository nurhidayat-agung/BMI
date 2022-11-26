import 'dart:math';

import '../constants/constant.dart';

class BMICalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BMICalculator({required this.weight, required this.height});
  BMICalculator.fromBMIValue(this.bmi) {}

  double calculateBMI() {
    double heightInMetter = height! / 100;

    final h = heightInMetter * heightInMetter;
    bmi = (weight! / h);

    return bmi!;
  }

  determineBMICategory(double bmiValue) {
    String category = "";

    if (bmiValue < 16.0) {
      category = underWeightSevere;
    } else if (16.0 <= bmiValue && bmiValue < 17.0) {
      category = underWeightModerate;
    } else if (17.0 <= bmiValue && bmiValue < 18.5) {
      category = underWeightMild;
    } else if (18.5 <= bmiValue && bmiValue < 25.0) {
      category = normal;
    } else if (25.0 <= bmiValue && bmiValue < 30.0) {
      category = overweight;
    } else if (30.0 <= bmiValue && bmiValue < 35.0) {
      category = obes1;
    } else if (35.0 <= bmiValue && bmiValue < 40.0) {
      category = obes2;
    } else if (40.0 <= bmiValue) {
      category = obes3;
    }

    bmiCategory = category;

    return bmiCategory;
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

    bmiDescription = desc;
    return bmiDescription;
  }
}

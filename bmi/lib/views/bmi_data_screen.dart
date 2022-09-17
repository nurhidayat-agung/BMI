import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: BMICard(
                    child: GenderIconText(
                      icon: Icons.male,
                      title: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    child: GenderIconText(
                      icon: Icons.female,
                      title: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: BMICard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("182",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: 100,
                      min: 80,
                      max: 200,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const BmiResultScreen();
                  },
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              height: 60,
              child: const Center(
                child: Text("Hitung BMI"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272A4e),
        borderRadius: BorderRadius.circular(15),
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
        Icon(icon, size: 80),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project_machine/DiabetesPage.dart';
import 'package:project_machine/HighBloodPressurePage.dart';

class ills extends StatelessWidget {
  const ills({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر مرضك'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'اختر المرض الذي تعاني منه',
                      speed: const Duration(milliseconds: 150),
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: false,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DiabetesPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Customize button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'السكري',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodPressureDietPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Customize button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'ضغط الدم المرتفع',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

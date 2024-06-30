import 'package:flutter/material.dart';
import 'package:project_machine/food_plane.dart';
import 'package:project_machine/ills.dart';

class Model extends StatelessWidget {
  const Model({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthMetricsScreen(),
    );
  }
}

class HealthMetricsScreen extends StatefulWidget {
  const HealthMetricsScreen({super.key});

  @override
  _HealthMetricsScreenState createState() => _HealthMetricsScreenState();
}

class _HealthMetricsScreenState extends State<HealthMetricsScreen>
    with SingleTickerProviderStateMixin {
  var selectedGender;
  var selectedActivity;
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final bmiController = TextEditingController();
  final bmrController = TextEditingController();
  final calorieController = TextEditingController();
  double recommendedCalories = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isCalculating = false;
  bool showResults = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    bmiController.dispose();
    bmrController.dispose();
    calorieController.dispose();
    super.dispose();
  }

  void _calculateMetrics() {
    setState(() {
      isCalculating = true;
      showResults = false; // Reset showResults flag
    });

    final double weight = double.tryParse(weightController.text) ?? 0;
    final double height = double.tryParse(heightController.text) ?? 0;
    final int age = int.tryParse(ageController.text) ?? 0;

    Future.delayed(const Duration(seconds: 1), () {
      if (weight > 0 &&
          height > 0 &&
          age > 0 &&
          selectedGender != null &&
          selectedActivity != null) {
        final double bmi = weight / (height * height);
        double bmr;
        if (selectedGender == "Male") {
          bmr = 10 * weight + 6.25 * (height * 100) - 5 * age + 5;
        } else {
          bmr = 10 * weight + 6.25 * (height * 100) - 5 * age - 161;
        }

        double calorieIntake;
        switch (selectedActivity) {
          case "Low":
            calorieIntake = bmr * 1.2;
            break;
          case "Medium":
            calorieIntake = bmr * 1.55;
            break;
          case "High":
            calorieIntake = bmr * 1.725;
            break;
          default:
            calorieIntake = bmr * 1.2;
        }

        setState(() {
          bmiController.text = bmi.toStringAsFixed(2);
          bmrController.text = bmr.toStringAsFixed(2);
          calorieController.text = calorieIntake.toStringAsFixed(2);
          recommendedCalories = calorieIntake;
          isCalculating = false;
          showResults = true; // Set showResults flag to true after calculation
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Calculation successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        setState(() {
          isCalculating = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter valid values for all fields.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Metrics Calculator'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/background111.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Image.asset(
                      "images/min-football.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.green,
                      size: 70,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ills()),
                      );
                    },
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "KEEP  IN IDEAL WEIGHT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildCustomTextField(
                    controller: ageController,
                    hintText: 'Age',
                    icon: Icons.cake,
                  ),
                  const SizedBox(height: 16),
                  _buildCustomDropdown(
                    hint: "Gender",
                    value: selectedGender,
                    items: ["Male", "Female"],
                    onChanged: (val) {
                      setState(() {
                        selectedGender = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildCustomDropdown(
                    hint: "Activity Level",
                    value: selectedActivity,
                    items: ["Low", "Medium", "High"],
                    onChanged: (val) {
                      setState(() {
                        selectedActivity = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildCustomTextField(
                    controller: weightController,
                    hintText: 'Weight (Kg)',
                    icon: Icons.line_weight,
                  ),
                  const SizedBox(height: 16),
                  _buildCustomTextField(
                    controller: heightController,
                    hintText: 'Height (m)',
                    icon: Icons.height,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateMetrics,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: Colors.green, // Background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Rounded corners
                      ),
                    ),
                    child: isCalculating
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Calculate BMI & BMR & Calories',
                            style: TextStyle(fontSize: 18),
                          ),
                  ),
                  const SizedBox(height: 20),
                  if (showResults) ...[
                    _buildResultCard(
                      title: 'BMI',
                      value: bmiController.text,
                    ),
                    const SizedBox(height: 16),
                    _buildResultCard(
                      title: 'BMR',
                      value: bmrController.text,
                    ),
                    const SizedBox(height: 16),
                    _buildResultCard(
                      title: 'Recommended Calories',
                      value: calorieController.text,
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      minWidth: 300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodPlanPage(
                              recommendedCalories: recommendedCalories,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Your Plan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: const Icon(Icons.arrow_drop_down, color: Colors.green),
        title: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(hint),
            value: value,
            items: items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

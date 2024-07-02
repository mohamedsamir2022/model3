import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_machine/DietSection.dart';

class DiabetesPage extends StatefulWidget {
  const DiabetesPage({super.key});

  @override
  _DiabetesPageState createState() => _DiabetesPageState();
}

class _DiabetesPageState extends State<DiabetesPage> {
  int totalCalories = 0;
  int consumedCalories = 0;
  int? userAge; // Nullable to avoid default value
  String? userGender; // Nullable to avoid default value
  int? recommendedCalories; // Nullable to avoid default value

  void addCalories(int calories) {
    setState(() {
      if (consumedCalories + calories <= recommendedCalories!) {
        totalCalories += calories;
        consumedCalories += calories;
      } else {
        // Optionally show a message or handle exceeding calories
        // Here, we just prevent adding more calories
      }
    });
  }

  // Function to calculate recommended daily calorie intake based on user data
  int calculateRecommendedCalories({required int age, required String gender}) {
    int recommendedCalories = 0;

    // Example using Harris-Benedict equation coefficients
    if (gender == 'Male') {
      recommendedCalories =
          (88.362 + (13.397 * age) + (4.799 * 175) - (5.677 * age)).toInt();
    } else {
      recommendedCalories =
          (447.593 + (9.247 * age) + (3.098 * 175) - (4.330 * age)).toInt();
    }

    return recommendedCalories;
  }

  void calculateAndSetRecommendedCalories() {
    if (userAge != null && userGender != null) {
      setState(() {
        recommendedCalories =
            calculateRecommendedCalories(age: userAge!, gender: userGender!);

        // Check and adjust total calories if necessary
        if (consumedCalories > recommendedCalories!) {
          totalCalories = recommendedCalories!;
          consumedCalories = recommendedCalories!;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خطة غذائيه لمرضي السكري'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/background111.png'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserInformationInput(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateAndSetRecommendedCalories,
                  child: const Text(
                    'اضغط',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                if (recommendedCalories != null) ...[
                  _buildCalorieTracker(),
                  const SizedBox(height: 20),
                ],
                DietSection(
                  meal: 'الإفطار',
                  items: [
                    DietItem('الشوفان مع الفواكه الطازجة والمكسرات', 150),
                    DietItem('خبز القمح الكامل مع الأفوكادو', 120),
                    DietItem('زبادي قليل الدسم مع التوت', 100),
                  ],
                  addCalories: addCalories,
                ),
                Row(
                  children: [
                    Image.asset(
                      "images/nutes-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/toast-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/urgent-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                  ],
                ),
                DietSection(
                  meal: 'الغداء',
                  items: [
                    DietItem('سلطة الدجاج المشوي مع الخضروات المشكلة', 300),
                    DietItem('الكينوا مع الخضار المقلي', 350),
                    DietItem(' العدس مع خبز القمح الكامل', 250),
                  ],
                  addCalories: addCalories,
                ),
                Row(
                  children: [
                    Image.asset(
                      "images/grilled_chicken-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/DSC_0276-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/vegetable-curry-with-rice-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                  ],
                ),
                DietSection(
                  meal: 'العشاء',
                  items: [
                    DietItem('السلمون المشوي مع الخضروات المطبوخة', 400),
                    DietItem('الأرز البني مع البروكلي', 350),
                    DietItem('الكاري  مع الأرز البني', 300),
                  ],
                  addCalories: addCalories,
                ),
                Row(
                  children: [
                    Image.asset(
                      "images/salamon-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/Sheet-Pan-Tofu-and-Broccoli-Teriyaki-removebg-preview.png",
                      height: 70,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/curry.png",
                      height: 70,
                      width: 80,
                    ),
                  ],
                ),
                DietSection(
                  meal: 'الوجبات الخفيفة',
                  items: [
                    DietItem('الفواكه الطازجة', 50),
                    DietItem('المكسرات والبذور', 100),
                    DietItem(' الخضراوات مع الحمص', 80),
                    DietItem('الجبن قليل الدسم', 70),
                  ],
                  addCalories: addCalories,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'يمكنك اتباع هذه الخطة الغذائية بدلاً من ذلك',
                      speed: const Duration(milliseconds: 150),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: false,
                ),
                Image.asset(
                  "images/dietplane-removebg-preview.png",
                  height: 800,
                  width: 650,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInformationInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'أدخل معلوماتك:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildAgeInput(),
        const SizedBox(height: 20),
        _buildGenderSelection(),
      ],
    );
  }

  Widget _buildAgeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'العمر:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                userAge = int.tryParse(value);
              });
            },
            decoration: const InputDecoration(
              hintText: 'أدخل عمرك',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال عمرك';
              }
              int age = int.tryParse(value)!;
              if (age < 0 || age > 120) {
                return 'يرجى إدخال عمر صالح';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الجنس:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: DropdownButtonFormField<String>(
            value: userGender,
            onChanged: (value) {
              setState(() {
                userGender = value;
              });
            },
            items: ['ذكر', 'أنثى']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalorieTracker() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'السعرات الحرارية اليومية الموصى بها:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${recommendedCalories ?? 0} سعر حراري',
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'إجمالي السعرات اليوم:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$totalCalories سعر حراري',
                  style: TextStyle(
                      fontSize: 18,
                      color: totalCalories <= recommendedCalories!
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

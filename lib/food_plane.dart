import 'package:flutter/material.dart';

class FoodPlanPage extends StatefulWidget {
  final double recommendedCalories;

  const FoodPlanPage({super.key, required this.recommendedCalories});

  @override
  _FoodPlanPageState createState() => _FoodPlanPageState();
}

class _FoodPlanPageState extends State<FoodPlanPage> {
  List<Map<String, dynamic>> selectedMeals = [];
  double totalCalories = 0;

  List<Map<String, dynamic>> meals = [
    {
      "meal": "فطور",
      "description":
          "دقيق الشوفان مع التوت الطازج، اللوز المقطع، وقليل من العسل",
      "calories": 300,
      "protein": 5,
      "carbs": 55,
      "fat": 7
    },
    {
      "meal": "وجبة خفيفة",
      "description": "زبادي يوناني مع العسل وقليل من الجرانولا",
      "calories": 150,
      "protein": 10,
      "carbs": 15,
      "fat": 3
    },
    {
      "meal": "غداء",
      "description":
          "صدر دجاج مشوي يقدم مع الكينوا، الخضار المختلطة، الطماطم الكرزية، وخل خفيف",
      "calories": 450,
      "protein": 40,
      "carbs": 30,
      "fat": 15
    },
    {
      "meal": "وجبة خفيفة",
      "description": "شرائح تفاح مع زبدة اللوز",
      "calories": 200,
      "protein": 4,
      "carbs": 25,
      "fat": 10
    },
    {
      "meal": "عشاء",
      "description":
          "فيليه سلمون متبل بالأعشاب والليمون مع خضروات مشوية (كوسا، فلفل، وجزر)",
      "calories": 500,
      "protein": 35,
      "carbs": 20,
      "fat": 25
    },
    {
      "meal": "فطور",
      "description":
          "بيض مخفوق مع الخضروات (فلفل، سبانخ، وبصل) يقدم على توست قمح كامل",
      "calories": 350,
      "protein": 20,
      "carbs": 30,
      "fat": 15
    },
    {
      "meal": "وجبة خفيفة",
      "description":
          "مكسرات متنوعة (لوز، جوز، وكاجو) مع فواكه مجففة (زبيب ومشمش)",
      "calories": 250,
      "protein": 8,
      "carbs": 20,
      "fat": 18
    },
    {
      "meal": "غداء",
      "description":
          "راب الديك الرومي والأفوكادو مع تورتيلا قمح كامل، سبانخ طازج، وطماطم مقطعة",
      "calories": 400,
      "protein": 30,
      "carbs": 40,
      "fat": 15
    },
    {
      "meal": "وجبة خفيفة",
      "description": "شرائح جزر مع حمص",
      "calories": 150,
      "protein": 4,
      "carbs": 20,
      "fat": 8
    },
    {
      "meal": "عشاء",
      "description":
          "شريحة لحم مشوية متبلة بالثوم والأعشاب، تقدم مع بطاطا حلوة مهروسة وهليون مطهو على البخار",
      "calories": 600,
      "protein": 45,
      "carbs": 40,
      "fat": 25
    },
    {
      "meal": "فطور",
      "description":
          "وعاء سموثي مصنوع من التوت المختلط المهروس، ويعلوه جرانولا، بذور الشيا، وقليل من زبدة اللوز",
      "calories": 400,
      "protein": 15,
      "carbs": 60,
      "fat": 10
    },
    {
      "meal": "وجبة خفيفة",
      "description": "جبن (شيدر وموزاريلا) مع بسكويت قمح كامل",
      "calories": 300,
      "protein": 12,
      "carbs": 25,
      "fat": 18
    },
    {
      "meal": "غداء",
      "description":
          "سلطة كينوا مع حمص، طماطم كرزية، خيار، بصل أحمر، وتتبيلة ليمون وأعشاب",
      "calories": 450,
      "protein": 20,
      "carbs": 60,
      "fat": 15
    },
    {
      "meal": "وجبة خفيفة",
      "description": "موز مع زبدة الفول السوداني الطبيعية",
      "calories": 250,
      "protein": 6,
      "carbs": 30,
      "fat": 12
    },
    {
      "meal": "عشاء",
      "description":
          "أفخاذ دجاج مشوية متبلة بالبابريكا والزعتر، تقدم مع أرز بني وفاصوليا خضراء مقلية",
      "calories": 550,
      "protein": 40,
      "carbs": 45,
      "fat": 20
    },
    {
      "meal": "فطور",
      "description":
          "توست الأفوكادو على خبز الحبوب الكاملة مع شرائح الطماطم ورش جبنة فيتا",
      "calories": 350,
      "protein": 10,
      "carbs": 30,
      "fat": 20
    },
    {
      "meal": "وجبة خفيفة",
      "description":
          "مزيج المسارات مع توت بري مجفف، لوز، بذور اليقطين، ورقائق الشوكولاتة الداكنة",
      "calories": 200,
      "protein": 5,
      "carbs": 25,
      "fat": 10
    },
    {
      "meal": "غداء",
      "description":
          "صدر دجاج محشو بالسبانخ والفيتا يقدم مع الكينوا وكرنب بروكسل المشوي",
      "calories": 500,
      "protein": 45,
      "carbs": 30,
      "fat": 25
    },
    {
      "meal": "وجبة خفيفة",
      "description": "جبنة قريش مع شرائح الخوخ",
      "calories": 150,
      "protein": 12,
      "carbs": 20,
      "fat": 5
    },
    {
      "meal": "عشاء",
      "description":
          "باستا مع صلصة المارينارا، يعلوها جمبري مشوي، وجانب من خبز الثوم",
      "calories": 600,
      "protein": 30,
      "carbs": 80,
      "fat": 20
    },
  ];

  void _addMeal(Map<String, dynamic> meal) {
    if (totalCalories + meal['calories'] <= widget.recommendedCalories) {
      setState(() {
        selectedMeals.add(meal);
        totalCalories += meal['calories'];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${meal['meal']} أضيفت إلى خطتك!')),
      );
    } else {
      _showCalorieLimitAlert();
    }
  }

  void _removeMeal(Map<String, dynamic> meal) {
    setState(() {
      selectedMeals.remove(meal);
      totalCalories -= meal['calories'];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${meal['meal']} أزيلت من خطتك!')),
    );
  }

  void _showCalorieLimitAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تجاوزت الحد الأقصى للسعرات الحرارية"),
          content: const Text(
              "إضافة هذه الوجبة ستتجاوز حد السعرات الحرارية الموصى به."),
          actions: [
            TextButton(
              child: const Text("موافق"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("الخطة الموصى بها"),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/R (1).png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الحد اليومي الموصى به للسعرات الحرارية هو ${widget.recommendedCalories.toStringAsFixed(2)} سعرة حرارية.",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "الخطة الغذائية الموصى بها:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: _generateFoodPlan(),
                  ),
                ),
                _calorieSummaryCard(widget.recommendedCalories - totalCalories),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _generateFoodPlan() {
    return meals.map((meal) {
      bool isSelected = selectedMeals.contains(meal);
      return GestureDetector(
        onTap: () {
          if (isSelected) {
            _removeMeal(meal);
          } else {
            _addMeal(meal);
          }
        },
        child: _foodItem(meal, isSelected),
      );
    }).toList();
  }

  Widget _foodItem(Map<String, dynamic> meal, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          tileColor: isSelected ? Colors.green[50] : Colors.white,
          title: Text(
            meal['meal'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meal['description'], style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              Text(
                "بروتين: ${meal['protein']}غ، كربوهيدرات: ${meal['carbs']}غ، دهون: ${meal['fat']}غ",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${meal['calories']} سعرة",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Icon(
                Icons.local_dining,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _calorieSummaryCard(double remainingCalories) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        color: Colors.green,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "السعرات الحرارية المتبقية:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${remainingCalories.toStringAsFixed(2)} سعرة حرارية",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

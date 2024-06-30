import 'package:flutter/material.dart';

class BloodPressureDietPage extends StatelessWidget {
  const BloodPressureDietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('High Blood Pressure Diet Plan'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Diet Plan for High Blood Pressure',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Here is a recommended diet plan to help manage high blood pressure:',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              _buildDietItem(
                'Fruits and Vegetables',
                'Eat a variety of fruits and vegetables every day. Aim for at least 5 servings.',
                'images/R (1).png',
              ),
              _buildDietItem(
                'Whole Grains',
                'Choose whole grain options like brown rice, oats, and whole wheat bread.',
                'images/vegetable-curry-with-rice-removebg-preview.png',
              ),
              _buildDietItem(
                'Lean Proteins',
                'Include lean proteins such as chicken, fish, beans, and legumes in your diet.',
                'images/Lean-Protein-Sources-530x377.jpg',
              ),
              _buildDietItem(
                'Low-Fat Dairy',
                'Opt for low-fat or fat-free dairy products like milk, yogurt, and cheese.',
                'images/fats-and-oil-in-food.jpg',
              ),
              _buildDietItem(
                'Reduce Sodium',
                'Limit the intake of salty foods and avoid adding extra salt to meals.',
                'images/lower_sodium_intake.jpg',
              ),
              _buildDietItem(
                'Healthy Fats',
                'Incorporate healthy fats from sources like avocados, nuts, seeds, and olive oil.',
                'images/fats-and-oil-in-food.jpg',
              ),
              _buildDietItem(
                'Limit Alcohol and Caffeine',
                'Reduce the consumption of alcohol and caffeine as they can affect blood pressure.',
                'images/Caffeine_share.jpg',
              ),
              const SizedBox(height: 20),
              Text(
                'Remember to consult with a healthcare professional or a dietitian before making any significant changes to your diet.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              _buildTipsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDietItem(String title, String description, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tips for Managing High Blood Pressure',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        const SizedBox(height: 10),
        _buildTipItem(
          'Stay Active',
          'Engage in regular physical activity like walking, jogging, or swimming for at least 30 minutes most days of the week.',
          'images/stay_active.jpg',
        ),
        _buildTipItem(
          'Monitor Blood Pressure',
          'Regularly check your blood pressure to keep track of your progress and adjust your lifestyle as needed.',
          'images/blood-pressure-monitor-cuff-1.jpg',
        ),
        _buildTipItem(
          'Manage Stress',
          'Practice relaxation techniques such as meditation, deep breathing, and yoga to reduce stress levels.',
          'images/managr_stress.jpg',
        ),
        _buildTipItem(
          'Quit Smoking',
          'If you smoke, seek help to quit. Smoking increases blood pressure and heart disease risk.',
          'images/quit-smoking.jpg',
        ),
      ],
    );
  }

  Widget _buildTipItem(String title, String description, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
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

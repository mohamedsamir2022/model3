import 'package:flutter/material.dart';

class BloodPressureDietPage extends StatelessWidget {
  const BloodPressureDietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خطة غذائيه لمرضي ارتفاع ضغط الدم'),
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
              const SizedBox(height: 10),
              Text(
                'إليك خطة غذائيه موصى بها للمساعدة في إدارة ارتفاع ضغط الدم:',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              _buildDietItem(
                'الفواكه والخضروات',
                'تناول مجموعة متنوعة من الفواكه والخضروات كل يوم. اهدف إلى تناول ما لا يقل عن 5 حصص.',
                'images/R (1).png',
              ),
              _buildDietItem(
                'الحبوب الكاملة',
                'اختر الخيارات المصنوعة من الحبوب الكاملة مثل الأرز البني والشوفان وخبز القمح الكامل.',
                'images/vegetable-curry-with-rice-removebg-preview.png',
              ),
              _buildDietItem(
                'البروتينات الخالية من الدهون',
                'اشمل البروتينات الخالية من الدهون مثل الدجاج والأسماك والفاصوليا والبقوليات في نظامك الغذائي.',
                'images/Lean-Protein-Sources-530x377.jpg',
              ),
              _buildDietItem(
                'منتجات الألبان قليلة الدسم',
                'اختر منتجات الألبان قليلة الدسم أو الخالية من الدسم مثل الحليب والزبادي والجبن.',
                'images/fats-and-oil-in-food.jpg',
              ),
              _buildDietItem(
                'تقليل الصوديوم',
                'قلل من تناول الأطعمة المالحة وتجنب إضافة الملح الزائد إلى الوجبات.',
                'images/lower_sodium_intake.jpg',
              ),
              _buildDietItem(
                'الدهون الصحية',
                'اشمل الدهون الصحية من مصادر مثل الأفوكادو والمكسرات والبذور وزيت الزيتون.',
                'images/fats-and-oil-in-food.jpg',
              ),
              _buildDietItem(
                'الحد من الكحول والكافيين',
                'قلل من استهلاك الكحول والكافيين حيث يمكن أن يؤثرا على ضغط الدم.',
                'images/Caffeine_share.jpg',
              ),
              const SizedBox(height: 20),
              Text(
                'تذكر استشارة أخصائي الرعاية الصحية أو أخصائي التغذية قبل إجراء أي تغييرات كبيرة في نظامك الغذائي.',
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
          'نصائح لإدارة ارتفاع ضغط الدم',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        const SizedBox(height: 10),
        _buildTipItem(
          'ابق نشيطًا',
          'اشترك في نشاط بدني منتظم مثل المشي أو الجري أو السباحة لمدة 30 دقيقة على الأقل معظم أيام الأسبوع.',
          'images/stay_active.jpg',
        ),
        _buildTipItem(
          'مراقبة ضغط الدم',
          'تحقق من ضغط الدم بانتظام لمتابعة تقدمك وضبط نمط حياتك حسب الحاجة.',
          'images/blood-pressure-monitor-cuff-1.jpg',
        ),
        _buildTipItem(
          'إدارة التوتر',
          'مارس تقنيات الاسترخاء مثل التأمل والتنفس العميق واليوغا لتقليل مستويات التوتر.',
          'images/managr_stress.jpg',
        ),
        _buildTipItem(
          'الإقلاع عن التدخين',
          'إذا كنت تدخن، ابحث عن المساعدة للإقلاع. يزيد التدخين من ضغط الدم وخطر الإصابة بأمراض القلب.',
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

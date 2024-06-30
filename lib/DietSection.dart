import 'package:flutter/material.dart';

class DietSection extends StatelessWidget {
  final String meal;
  final List<DietItem> items;
  final Function(int) addCalories;

  const DietSection({super.key, 
    required this.meal,
    required this.items,
    required this.addCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            meal,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: const Icon(Icons.check, color: Colors.green),
              title: Text(item.name),
              trailing: Text('${item.calories} kcal'),
              onTap: () => addCalories(item.calories),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class DietItem {
  final String name;
  final int calories;

  DietItem(this.name, this.calories);
}

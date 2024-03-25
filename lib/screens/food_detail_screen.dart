import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final Map<String, dynamic> foodData;

  const FoodDetailPage({Key? key, required this.foodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodData['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              foodData['image'],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 8.0),
            Text(
              foodData['name'],
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${foodData['tags'].join(', ')}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '재료:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              // Check if ingredients exist, if not, display a message
              foodData.containsKey('ingredients') ? foodData['ingredients'].join(', ') : 'No ingredients available',
            ),
            const SizedBox(height: 8.0),
            const Text(
              '요리 레시피:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRecipeList(foodData['recipe']),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRecipeList(List<dynamic>? recipe) {
    List<Widget> widgets = [];
    if (recipe != null) {
      for (var step in recipe) {
        widgets.add(
          ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(step),
          ),
        );
      }
    } else {
      widgets.add(const Text('No recipe available'));
    }
    return widgets;
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:foodrecipe/provider/foodcart_provider.dart';

class FoodCartAddPage extends StatefulWidget {
  const FoodCartAddPage({Key? key}) : super(key: key);

  @override
  FoodCartAddPageState createState() => FoodCartAddPageState();
}

class FoodCartAddPageState extends State<FoodCartAddPage> {
  List<dynamic> allFoodData = []; // 모든 음식 데이터를 저장할 리스트
  Set<String> selectedIngredients = Set(); // 선택된 재료를 저장할 집합
  Set<String> allIngredients = Set(); // 모든 재료를 저장할 집합

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final chineseJsonString =
          await rootBundle.loadString('assets/chinesefood_data.json');
      final koreanJsonString =
          await rootBundle.loadString('assets/koreafood_data.json');
      final westernJsonString =
          await rootBundle.loadString('assets/westernfood_data.json');

      setState(() {
        // 각 JSON 파일의 데이터를 하나의 리스트로 합침
        allFoodData.addAll(json.decode(chineseJsonString));
        allFoodData.addAll(json.decode(koreanJsonString));
        allFoodData.addAll(json.decode(westernJsonString));

        // 모든 음식 데이터에서 재료를 추출하여 저장
        for (var item in allFoodData) {
          final ingredients = item['ingredients'] as List?;
          if (ingredients != null) {
            allIngredients.addAll(ingredients.cast<String>());
          }
        }
      });
    } catch (error) {
      print('Error loading JSON data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('재료 선택'),
        actions: [
          // 저장하기 버튼 추가
          IconButton(
            onPressed: () {
              // 선택된 재료를 FoodCartProvider에 저장
              Provider.of<FoodCartProvider>(context, listen: false)
                  .setSelectedIngredients(selectedIngredients);
              Navigator.pop(context); // 페이지 닫기
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '재료 선택:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // 각 재료와 체크박스를 출력
              for (var ingredient in allIngredients)
                CheckboxListTile(
                  title: Text(ingredient),
                  value: selectedIngredients.contains(ingredient),
                  onChanged: (value) {
                    setState(() {
                      if (value != null && value) {
                        selectedIngredients.add(ingredient);
                      } else {
                        selectedIngredients.remove(ingredient);
                      }
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodrecipe/screens/all_food_resipe_menu_screen.dart';
import 'package:foodrecipe/screens/setting_screen.dart';
import 'package:foodrecipe/widgets/custom_pageroute_widget.dart';
import '../screens/home_screen.dart';
import 'package:foodrecipe/cons/colortable.dart';
import 'package:foodrecipe/screens/bookmark_screen.dart';

class BottomNavigator extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigator({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  void _navigateToIndex(BuildContext context, int index) {
    if (selectedIndex == index) {
      return; // 이미 선택된 페이지일 경우 아무런 동작도 하지 않음
    }
    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          CustomPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
        break;
      case 1:
        Navigator.pushAndRemoveUntil(
          context,
          CustomPageRoute(
            builder: (context) => AllFoodPage(
              title: '요리 레시피',
              jsonFileNames: ['koreafood_data', 'chinesefood_data', 'westernfood_data'], // 수정된 부분: 파일 이름만으로 변경
            ),
          ),
              (route) => false,
        );
      case 2:
        Navigator.pushAndRemoveUntil(
            context,
            CustomPageRoute(builder: (context) => BookMarkPage()),
              (route) => false
        );
        break;
      case 3:
        // '설정' 아이템을 눌렀을 때의 동작
        Navigator.pushAndRemoveUntil(
          context,
          CustomPageRoute(builder: (context) => const SettingPage()),
          (route) => false,
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: '음식',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: '즐겨찾기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: selectedcolor,
      unselectedItemColor: Colors.grey,
      onTap: (index) => _navigateToIndex(context, index), // 수정된 부분입니다.
    );
  }
}

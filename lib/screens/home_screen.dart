import 'package:flutter/material.dart';
import '../widgets/category_button_widget.dart';
import '../widgets/custom_bottom_navigation_action_widget.dart';
import '../widgets/custom_search_delegate_widget.dart';
import 'foodrecipemenu_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(3),
          child: CircleAvatar(
            // CircleAvatar의 radius를 AppBar 높이에 맞게 조정하세요.
            backgroundImage: AssetImage('assets/logo.JPG'),
            backgroundColor: Colors.transparent,
          ),
        ),
        // AppBar에서 actions 대신 title 속성을 사용하여 타원형 텍스트 필드를 추가합니다.
        title: InkWell(
          onTap: () {
            // 텍스트 필드를 탭했을 때 검색 페이지로 이동합니다.
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(context),
            );
          },
          child: Container(
            height: 40, // 텍스트 필드의 높이입니다.
            decoration: BoxDecoration(
              color: Colors.grey[200], // 텍스트 필드의 배경색입니다.
              borderRadius:
                  BorderRadius.circular(20), // 타원형 모양을 만들기 위한 테두리 반경입니다.
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '오늘의 레시피를 검색해보세요!', // 텍스트 필드의 플레이스홀더 텍스트입니다.
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.search, // 오른쪽에 위치할 검색 아이콘입니다.
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://via.placeholder.com/700',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '요리 종류',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(
                  imageUrl: 'https://via.placeholder.com/150',
                  buttonText: '한식',
                  jsonFileNames: ['koreafood_data'], // 수정된 부분: JSON 파일 이름들의 리스트를 전달
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodPage(
                          title: '한식',
                          jsonFileNames: ['koreafood_data'], // 수정된 부분: JSON 파일 이름들의 리스트를 전달
                        ),
                      ),
                    );
                  },
                ),

                CategoryButton(
                  imageUrl: 'https://via.placeholder.com/150',
                  buttonText: '중식',
                  jsonFileNames: ['chinesefood_data'],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodPage(
                              title: '중식',
                              jsonFileNames: ['chinesefood_data']
                          )
                      ),
                    );
                  },
                ),
                CategoryButton(
                  imageUrl: 'https://via.placeholder.com/150',
                  buttonText: '양식',
                  jsonFileNames: ['westernfood_data'],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodPage(
                                title: '양식',
                                jsonFileNames: ['westernfood_data'],
                              )),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '손쉽게 할 수 있는 요리',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 120,
                        child: Image.network(
                          'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '당신의 요리 솜씨를 뽐내보세요!',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 120,
                        child: Image.network(
                          'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';


class CategoryButton extends StatelessWidget {
  final String imageUrl;
  final String buttonText;
  final List<String> jsonFileNames; // 수정된 부분: JSON 파일 이름들의 리스트
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.imageUrl,
    required this.buttonText,
    required this.jsonFileNames,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


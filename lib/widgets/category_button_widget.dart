import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String imageUrl;
  final String buttonText;
  final VoidCallback onPressed;
  final List<String> jsonFileNames;

  const CategoryButton({super.key,
    required this.imageUrl,
    required this.buttonText,
    required this.onPressed,
    required this.jsonFileNames,
  });

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

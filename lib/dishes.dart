import 'package:flutter/material.dart';

class DishWidget extends StatelessWidget {
  final String dishName;
  final String dishImage;

  const DishWidget({
    Key? key,
    required this.dishName,
    required this.dishImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dishName,
          
        ),
        if (dishImage.isNotEmpty) ...[
          const SizedBox(height: 20),
          Image.asset(
            dishImage, // Display the selected dish image
            height: 200,
            width: 200,
          ),
        ],
      ],
    );
  }
}

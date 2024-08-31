import 'package:flutter/material.dart';
import 'dart:math';

import 'package:whattocookapp/dishes.dart'; // Correct import for DishWidget

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  final List<Map<String, String>> dishes = [
    {'name': 'Biryani', 'image': 'lib/image/biryani.png'},
    {'name': 'Karahi', 'image': 'lib/image/karahi.png'},
    {'name': 'Nihari', 'image': 'lib/image/nihari.png'},
    {'name': 'Palak Paneer', 'image': 'lib/image/palak.png'},
    {'name': 'Daal Chawal', 'image': 'lib/image/daal chawal.png'},
    {'name': 'Qeema', 'image': 'lib/image/qeema.png'},
  ];

  final List<String> diceImages = [
    'lib/image/dice-six-faces-one.png',
    'lib/image/dice-six-faces-two.png',
    'lib/image/dice-six-faces-three.png',
    'lib/image/dice-six-faces-four.png',
    'lib/image/dice-six-faces-five.png',
    'lib/image/dice-six-faces-six.png'
  ];

  int currentDiceIndex = 0;
  String selectedDish = 'Tap the dice to get a dish!';
  String selectedDishImage = '';

  void updateDish(int diceIndex) {
    setState(() {
      print('Dice Index: $diceIndex'); // Debug print
      currentDiceIndex = diceIndex;
      selectedDish = dishes[diceIndex]['name']!;
      selectedDishImage = dishes[diceIndex]['image']!;
    });
  }

  void rollDice() {
    int diceIndex = Random().nextInt(6); // Generates a random number between 0 and 5
    print('Rolling Dice...'); // Debug print
    setState(() {
      currentDiceIndex = diceIndex;
      updateDish(diceIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinner Roulette'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: rollDice, // Call rollDice when tapped
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  diceImages[currentDiceIndex], // Display the current dice image
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Tap to roll the dice",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 40),
            DishWidget(
              dishName: selectedDish,
              dishImage: selectedDishImage,
            ), // Display the selected dish
          ],
        ),
      ),
    );
  }
}

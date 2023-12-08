import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FruitApp(),
    );
  }
}

class FruitApp extends StatefulWidget {
  @override
  _FruitAppState createState() => _FruitAppState();
}

class _FruitAppState extends State<FruitApp> {
  String selectedFruit = '';
  Map<String, String> fruitImages = {
    'apple': '../assets/apple.jpeg',
    'orange': '../assets/orange.jpeg',
    'banana': '../assets/banana.jpeg',
    'watermelon': '../assets/watermelon.jpeg',
    'rambutan': '../assets/rambutan.jpeg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  selectedFruit = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter a fruit',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (fruitImages.containsKey(selectedFruit)) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(selectedFruit.toUpperCase()),
                          content: Image.asset(fruitImages[selectedFruit]!),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final List<String> fruits = fruitImages.keys.toList();
                    final Random random = Random();
                    final String randomFruit =
                        fruits[random.nextInt(fruits.length)];

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(randomFruit.toUpperCase()),
                        content: Image.asset(fruitImages[randomFruit]!),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('I am feeling lucky'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

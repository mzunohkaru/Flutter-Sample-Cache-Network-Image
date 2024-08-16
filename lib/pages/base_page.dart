import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/250?image=$index',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

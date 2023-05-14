import 'package:flutter/material.dart';

class HeadOfPage extends StatelessWidget {
  final String title;
  final String image;
  const HeadOfPage({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              image,
              width: 75,
              height: 75,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String from;
  final String to;
  const CustomAppBar({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        height: 250,
        color: const Color(0xff2b32b2),
        child: Column(
          children: [
            Image.asset(
              "assets/bus.png",
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  from,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  to,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h * 0.65);
    path.quadraticBezierTo(w * 0.5, h, w, h * 0.65);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

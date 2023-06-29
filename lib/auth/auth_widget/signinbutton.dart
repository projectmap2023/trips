import 'package:flutter/material.dart';
import 'package:trips/colors.dart';

class SignButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const SignButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          child: InkWell(
            splashColor: Colors.white,
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                color: AppColor.firstColor,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              width: 120,
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trips/colors.dart';

class SignTextButton extends StatelessWidget {
  final String textrow;
  final String lable;
  final Function() onTap;

  const SignTextButton(
      {super.key,
      required this.textrow,
      required this.lable,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textrow,
          style: const TextStyle(fontSize: 17, color: Colors.black),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            lable,
            style: TextStyle(
              color: AppColor.firstColor,
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}

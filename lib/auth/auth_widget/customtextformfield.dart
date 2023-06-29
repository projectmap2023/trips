import 'package:flutter/material.dart';

import '../../colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String lable;
  final IconData iconData;

  final TextInputType textInputType;
  final bool? obscureText;
  final void Function()? onTap;
  final String? Function(String?) validator;
  final TextEditingController controller;
  const CustomTextFormField(
      {super.key,
      required this.lable,
      required this.iconData,
      required this.textInputType,
      this.obscureText,
      this.onTap,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscuringCharacter: "*",
        style: Theme.of(context).textTheme.bodySmall,
        obscureText: obscureText == false || obscureText == null ? false : true,
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIconColor: AppColor.firstColor,
          iconColor: Colors.black,
          hintText: "Enter your $lable",
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey[350]),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          label: Text(
            lable,
            style: TextStyle(color: AppColor.firstColor, fontSize: 17),
          ),
          errorStyle: const TextStyle(fontSize: 12, height: 0),
          suffixIcon: InkWell(onTap: onTap, child: Icon(iconData)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColor.firstColor,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}

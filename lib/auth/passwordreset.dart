import 'package:flutter/material.dart';
import 'package:trips/auth/auth_widget/customtextformfield.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/auth/auth_widget/signinbutton.dart';
import 'package:trips/colors.dart';
import 'package:trips/homepage.dart';

import 'authvalidator.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController password = TextEditingController();
    AuthValidator valid = AuthValidator();
    //double highOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.firstColor,
      body: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const HeadOfPage(
                title: "Password Reset",
                image: "assets/passwordrest.png",
              ),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Pleas Enter new password",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        obscureText: true,
                        iconData: Icons.lock_outlined,
                        controller: password,
                        validator: (val) {
                          return valid.passwordValidator(val!);
                        },
                        lable: "New password",
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        obscureText: true,
                        iconData: Icons.lock_outlined,
                        lable: "Repassword",
                        controller: password,
                        validator: (val) {
                          return valid.passwordValidator(val!);
                        },
                      ),
                      SignButton(
                        label: "Submit",
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trips/alertexitapp.dart';
import 'package:trips/auth/auth_widget/customtextformfield.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/auth/auth_widget/rowtextbutton.dart';
import 'package:trips/auth/auth_widget/signinbutton.dart';
import 'package:trips/auth/verifycodesignup.dart';
import 'package:trips/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double highOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.firstColor,
      body: WillPopScope(
          onWillPop: () {
            alertExitApp(context);
            return Future.value(true);
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadOfPage(
                    title: "Sign Up",
                    image: "assets/signup.png",
                  ),
                  Container(
                    height: highOfScreen * 0.75,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(100))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomTextFormField(
                          isNumber: false,
                          lable: "Username",
                          iconData: Icons.person_outline,
                        ),
                        const CustomTextFormField(
                          isNumber: false,
                          lable: "Email",
                          iconData: Icons.email_outlined,
                        ),
                        const CustomTextFormField(
                          isNumber: true,
                          iconData: Icons.phone_outlined,
                          lable: "Phone Number",
                        ),
                        const CustomTextFormField(
                          isNumber: false,
                          obscureText: true,
                          iconData: Icons.lock_outlined,
                          lable: "password",
                        ),
                        SigninButton(
                          label: "Sign Up",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VerificationCode()));
                          },
                        ),
                        SignTextButton(
                          textrow: "have an account? ",
                          lable: "Sign in",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

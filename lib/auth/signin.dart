import 'package:flutter/material.dart';
import 'package:trips/alertexitapp.dart';
import 'package:trips/auth/auth_widget/customtextformfield.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/auth/auth_widget/rowtextbutton.dart';
import 'package:trips/auth/auth_widget/signinbutton.dart';
import 'package:trips/auth/signup.dart';
import 'package:trips/auth/verifycode.dart';
import 'package:trips/colors.dart';
import 'package:trips/homepage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                    title: "Sign in",
                    image: "assets/signin.png",
                  ),
                  Container(
                    height: highOfScreen * 0.75,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Welcom Back \n",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          "sign in with your phone and password ",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
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
                        SignTextButton(
                          textrow: "",
                          lable: "Forget Password?",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VerificationCode()));
                          },
                        ),
                        SigninButton(
                          label: "Sign in",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                        ),
                        SignTextButton(
                          textrow: "Don't have an account? ",
                          lable: "signup",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
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

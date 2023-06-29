import 'package:flutter/material.dart';
import 'package:trips/alertexitapp.dart';
import 'package:trips/auth/auth_widget/customtextformfield.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/auth/auth_widget/rowtextbutton.dart';
import 'package:trips/auth/auth_widget/signinbutton.dart';
import 'package:trips/auth/signservices.dart';
import 'package:trips/auth/signup.dart';
import 'package:trips/auth/resetpassword.dart';
import 'package:trips/colors.dart';

import 'authvalidator.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthValidator valid = AuthValidator();
  @override
  Widget build(BuildContext context) {
    double highOfScreen = MediaQuery.of(context).size.height;
    SignServices signServices = SignServices();
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
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Welcom Back \n",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Text(
                            "sign in with your email and password ",
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                          CustomTextFormField(
                            textInputType: TextInputType.emailAddress,
                            iconData: Icons.email_outlined,
                            controller: _email,
                            validator: (val) {
                              return valid.emailValidator(val!);
                            },
                            lable: "email",
                          ),
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            obscureText: true,
                            iconData: Icons.lock_outlined,
                            controller: _password,
                            validator: (val) {
                              return valid.passwordValidator(val!);
                            },
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
                                          const ResetPassword()));
                            },
                          ),
                          SignButton(
                            label: "Sign in",
                            onTap: () {
                              final isValidFrom =
                                  formKey.currentState!.validate();
                              if (isValidFrom) {
                                signServices.signInWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text,
                                    context: context);
                              }
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
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

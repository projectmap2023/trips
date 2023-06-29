import 'package:flutter/material.dart';
import 'package:trips/alertexitapp.dart';
import 'package:trips/auth/auth_widget/customtextformfield.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/auth/auth_widget/rowtextbutton.dart';
import 'package:trips/auth/auth_widget/signinbutton.dart';
import 'package:trips/auth/signservices.dart';

import 'package:trips/colors.dart';
import 'authvalidator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  AuthValidator valid = AuthValidator();
  SignServices signServices = SignServices();
  final formKey = GlobalKey<FormState>();

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
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextFormField(
                            textInputType: TextInputType.name,
                            lable: "Username",
                            controller: _username,
                            iconData: Icons.person_outline,
                            validator: (val) {
                              return valid.usernameValidator(val!);
                            },
                          ),
                          CustomTextFormField(
                            textInputType: TextInputType.emailAddress,
                            lable: "Email",
                            controller: _email,
                            iconData: Icons.email_outlined,
                            validator: (val) {
                              return valid.emailValidator(val!);
                            },
                          ),
                          CustomTextFormField(
                            textInputType: TextInputType.phone,
                            iconData: Icons.phone_outlined,
                            controller: _phone,
                            lable: "Phone Number",
                            validator: (val) {
                              return valid.phoneValidator(val!);
                            },
                          ),
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            obscureText: true,
                            controller: _password,
                            iconData: Icons.lock_outlined,
                            validator: (val) {
                              return valid.passwordValidator(val!);
                            },
                            lable: "password",
                          ),
                          SignButton(
                            label: "Sign Up",
                            onTap: () {
                              final isValidFrom =
                                  formKey.currentState!.validate();
                              if (isValidFrom) {
                                signServices.createUserWithEmailAndPassword(
                                    username: _username.text,
                                    email: _email.text,
                                    password: _password.text,
                                    phone: _phone.text,
                                    context: context);
                              }
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
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

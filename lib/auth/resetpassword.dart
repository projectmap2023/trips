import 'package:flutter/material.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/auth/authvalidator.dart';
import 'package:trips/auth/signservices.dart';
import 'package:trips/colors.dart';
import 'auth_widget/customtextformfield.dart';
import 'auth_widget/signinbutton.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    double highOfScreen = MediaQuery.of(context).size.height;
    final TextEditingController email = TextEditingController();
    AuthValidator valid = AuthValidator();
    final formKey = GlobalKey<FormState>();
    SignServices signServices = SignServices();

    return Scaffold(
      backgroundColor: AppColor.firstColor,
      body: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeadOfPage(
                title: "Password Reset",
                image: "assets/verify.png",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "please Enter your Email to reset password",
                        style: TextStyle(fontSize: 17, height: 2),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        iconData: Icons.email_outlined,
                        controller: email,
                        lable: "email",
                        validator: (val) {
                          return valid.emailValidator(val!);
                        },
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      SignButton(
                        label: 'Submit',
                        onTap: () {
                          final isValidFrom = formKey.currentState!.validate();
                          if (isValidFrom) {
                            signServices.passwordReset(email.text, context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

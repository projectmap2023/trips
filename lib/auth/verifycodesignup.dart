import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:trips/auth/auth_widget/head_of_page.dart';
import 'package:trips/colors.dart';
import 'package:trips/homepage.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    double highOfScreen = MediaQuery.of(context).size.height;
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
                title: "verification",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "We sent a verification code to your phone ,Please enter the Digit code sent",
                      style: TextStyle(fontSize: 17, height: 2),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    OtpTextField(
                      numberOfFields: 5,
                      fieldWidth: 50,

                      //   borderRadius: const BorderRadius.all(Radius.circular(25)),
                      showCursor: false,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      focusedBorderColor: AppColor.firstColor,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: false,
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      }, // end onSubmit
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

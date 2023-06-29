import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trips/auth/signin.dart';

import '../homepage.dart';

class SignServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  showErrormessage(context, String? messeage) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      desc: messeage,
      btnOkOnPress: () {},
    ).show();
  }

  goToHome(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setBool("Loggedin", true);
  }

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      goToHome(context);
    } on FirebaseAuthException catch (e) {
      showErrormessage(context, e.message);
    }
  }

  sendEmailVerification(String email, context) async {
    try {
      await _firebaseAuth.currentUser!.sendEmailVerification();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        desc:
            "We have sent an email to verify your account. Go to the email and click on the link",
        btnOkOnPress: () {
          goToHome(context);
        },
      ).show();
    } on FirebaseAuthException catch (e) {
      showErrormessage(context, e.message);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String username,
      required String email,
      required String password,
      required String phone,
      required context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      creatUser(username, email, phone, context);
      sendEmailVerification(email, context);
    } on FirebaseAuthException catch (e) {
      showErrormessage(context, e.message);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setBool("Loggedin", false);
  }

  Future creatUser(String username, String email, String phone, context) async {
    try {
      final doucUser =
          FirebaseFirestore.instance.collection('Users').doc(email);
      final json = {
        "username": username,
        "Email": email,
        "phone": phone,
      };

      await doucUser.set(json);
    } on FirebaseAuthException catch (e) {
      showErrormessage(context, e.message);
    }
  }

  passwordReset(String email, context) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        desc:
            "We have sent an email to reset password. Go to the email and click on the link",
        btnOkOnPress: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const SignIn()));
        },
      ).show();
    } on FirebaseAuthException catch (e) {
      showErrormessage(context, e.message);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips/auth/signservices.dart';
import 'package:trips/colors.dart';

import 'auth_widget/signinbutton.dart';

userInfo(context) async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.currentUser!.reload();
  bool? status = firebaseAuth.currentUser!.emailVerified;

  SignServices signServices = SignServices();
  Map<String, dynamic>? userinfo;
  if (firebaseAuth.currentUser != null) {
    final docUser = FirebaseFirestore.instance
        .collection("Users")
        .doc(firebaseAuth.currentUser!.email);
    final snapshot = await docUser.get();
    userinfo = snapshot.data();
  }

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text(
            "User Information",
            textAlign: TextAlign.center,
          ),
          content: firebaseAuth.currentUser == null
              ? const Text("not found information")
              : Container(
                  height: 400,
                  width: 300,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        title: const Text("User Name"),
                        subtitle: Text("${userinfo!['username']}"),
                        leading: Icon(
                          Icons.person,
                          size: 35,
                          color: AppColor.firstColor,
                        ),
                      ),
                      ListTile(
                        title: const Text("Email"),
                        subtitle: Text("${userinfo['Email']}"),
                        leading: Icon(
                          Icons.email,
                          size: 35,
                          color: AppColor.firstColor,
                        ),
                      ),
                      ListTile(
                        title: const Text("Phone"),
                        subtitle: Text("${userinfo['phone']}"),
                        leading: Icon(
                          Icons.phone,
                          size: 35,
                          color: AppColor.firstColor,
                        ),
                      ),
                      ListTile(
                        title: const Text("Status"),
                        subtitle: Text(
                            status ? "email Verified" : "email not verified"),
                        leading: status
                            ? const Icon(
                                Icons.gpp_good_outlined,
                                size: 35,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.gpp_bad_outlined,
                                size: 35,
                                color: Colors.red,
                              ),
                      ),
                      SignButton(
                        label: "Sign out",
                        onTap: () {
                          signServices.signOut();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )));
}

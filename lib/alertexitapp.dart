import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

alertExitApp(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.scale,
    desc: "Do you want to exit the application?",
    btnOkOnPress: () {
      exit(0);
    },
    btnCancelOnPress: () {},
  ).show();
}

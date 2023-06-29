import 'package:awesome_dialog/awesome_dialog.dart';

warningDialog(context, String message) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    desc: message,
    btnOkOnPress: () {},
  ).show();
}

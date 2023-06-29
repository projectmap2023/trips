import 'package:email_validator/email_validator.dart';

class AuthValidator {
  usernameValidator(String val) {
    if (val.length < 3) {
      return "username cannot be less than 3";
    }
    if (val.length > 10) {
      return "username cannot be more than 10";
    }
  }

  emailValidator(String val) {
    if (!EmailValidator.validate(val)) {
      return "Enter a valid Email";
    }
  }

  phoneValidator(String val) {
    if (val.length < 11) {
      return "phone cannot be less than 11";
    }
    if (val.length > 11) {
      return "phone cannot be more than 11";
    }
  }

  passwordValidator(String val) {
    if (val.length < 6) {
      return "password cannot be less than 6";
    }
    if (val.length > 10) {
      return "password cannot be more than 10";
    }
  }
}

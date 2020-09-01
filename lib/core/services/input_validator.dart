import 'package:bloc_demo/utils/regex.dart';

class LoginValidator {
  bool validate(String email, String password) {
    RegExp standardEmail = RegExp(emailRegex);
    RegExp standardPassword = RegExp(passwordRegex);
    bool validEmail = standardEmail.hasMatch(email);
    bool validPassword = standardPassword.hasMatch(password);
    return validEmail && validPassword;
  }
}

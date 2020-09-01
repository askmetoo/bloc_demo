import 'package:bloc_demo/core/models/enums.dart';
import 'package:bloc_demo/core/services/input_validator.dart';

class UserAuth {
  Future<SignInResult> login(String email, String password) async {
    LoginValidator inputValidator = LoginValidator();
    bool validInput = inputValidator.validate(email, password);
    if (!validInput) return SignInResult.invalidInput;
    await Future.delayed(Duration(seconds: 2));
    return SignInResult.signedIn;
  }
}

import 'package:meta/meta.dart';

@immutable
abstract class RegistrationEvent {}

class SignIn extends RegistrationEvent {
  final String email;
  final String password;

  SignIn({this.email, this.password});
}

import 'package:meta/meta.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class SignInLoading extends RegistrationState {}

class SignInInvalidInput extends RegistrationState {}

class SignedIn extends RegistrationState {}

class SignUpLoading extends RegistrationState {}

class AccountCreated extends RegistrationState {}

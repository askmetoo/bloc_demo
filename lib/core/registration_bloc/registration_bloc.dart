import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:bloc_demo/core/models/enums.dart';
import 'package:bloc_demo/core/registration_bloc/registration_event.dart';
import 'package:bloc_demo/core/registration_bloc/registration_state.dart';
import 'package:bloc_demo/core/services/user_auth.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final _userAuth = UserAuth();

  RegistrationBloc() : super(RegistrationInitialState());

  @override
  Stream<RegistrationState> mapEventToState(event) async* {
    if (event is SignIn) {
      yield* _mapSignInEventToState(event);
    } else {
      throw UnimplementedError();
    }
  }

  Stream<RegistrationState> _mapSignInEventToState(
    SignIn signInEvent,
  ) async* {
    yield SignInLoading();
    var result = await _userAuth.login(signInEvent.email, signInEvent.password);
    if (result == SignInResult.signedIn) {
      yield SignedIn();
    } else if (result == SignInResult.invalidInput) {
      yield SignInInvalidInput();
    }
  }
}

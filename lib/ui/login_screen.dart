import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:bloc_demo/ui/components/form_input.dart';
import 'package:bloc_demo/core/registration_bloc/registration_bloc.dart';
import 'package:bloc_demo/core/registration_bloc/registration_state.dart';
import 'package:bloc_demo/core/registration_bloc/registration_event.dart';
import 'package:bloc_demo/utils/widget_init_callback.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  RegistrationBloc _registrationBloc;

  void showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(),
          child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              _registrationBloc = context.bloc<RegistrationBloc>();
              if (state is SignInInvalidInput) {
                onWidgetDidBuild(() {
                  showSnackBar(context, "you entered an invalid input");
                });
              } else if (state is SignedIn) {
                onWidgetDidBuild(() {
                  showSnackBar(context, "loggedIn successfully");
                });
              }
              return ModalProgressHUD(
                inAsyncCall: state is SignInLoading,
                progressIndicator: CircularProgressIndicator(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FormInput(
                      placeHolder: "Enter email",
                      inputType: TextInputType.emailAddress,
                      icon: Icons.email,
                      onChanged: (value) => email = value,
                    ),
                    FormInput(
                      inputType: TextInputType.text,
                      secret: true,
                      placeHolder: "Enter password",
                      icon: Icons.lock_outline,
                      onChanged: (value) => password = value,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _registrationBloc.add(
                            SignIn(email: email, password: password),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registrationBloc.close();
    super.dispose();
  }
}

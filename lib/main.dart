import 'package:flutter/material.dart';

import 'package:bloc_demo/ui/views/login_screen.dart';

void main() => runApp(BLoC());

class BLoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BLoC Example",
      home: LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authentication/login.dart';
import 'package:flutter_app/screens/authentication/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinPage = true;

  void switchPage() {
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinPage == true) {
      return Login(toggle: switchPage,);
    } else {
      return Register(toggle: switchPage);
    }
  }
}

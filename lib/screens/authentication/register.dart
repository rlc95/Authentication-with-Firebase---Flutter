import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/description.dart';
import 'package:flutter_app/constants/styles.dart';
import 'package:flutter_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgblck,
      appBar: AppBar(
        title: Text("REGISTER", style: TextStyle(color: Colors.white)),
        backgroundColor: bgblck,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 12),
          child: Column(
            children: [
              Text(description, style: descriptionStyle),
              Center(child: Image.asset("/logoedt.png", height: 250)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: inputTextDecoration,
                        validator:
                            (value) =>
                                value?.isEmpty == true
                                    ? "Enter a valid email"
                                    : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),

                      SizedBox(height: 20),

                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: inputTextDecoration.copyWith(
                          hintText: "password",
                        ),
                        validator:
                            (value) =>
                                value!.length < 6
                                    ? "Enter a valid password"
                                    : null,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),

                      SizedBox(height: 30),
                      Text(error, style:TextStyle(color: Colors.red),),
                      Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),

                      GestureDetector(
                        //Sign in using google
                        onTap: () {},
                        child: Center(
                          child: Image.asset("/google.png", height: 70),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: descriptionStyle,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            //go to login
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: mainBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      GestureDetector(
                        onTap: () async {
                          dynamic result = await _auth
                              .registerWithEmailandPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error = "Please enter valid email";
                            });
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgblck,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: mainYellow),
                          ),
                          child: Center(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

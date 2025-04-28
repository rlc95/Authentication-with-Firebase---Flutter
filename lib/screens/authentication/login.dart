import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/description.dart';
import 'package:flutter_app/constants/styles.dart';
import 'package:flutter_app/services/auth.dart';

class Login extends StatefulWidget {
  final Function toggle;
  const Login({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        title: Text("SIGN IN", style: TextStyle(color: Colors.white)),
        backgroundColor: bgblck,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 12),
          child: Column(
            children: [
              Text(description, style: descriptionStyle),
              Center(child: Image.asset("/logoedt.png", height: 230)),
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
                      Text(error, style: TextStyle(color: Colors.red)),
                      Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        //Sign in using google
                        onTap: () {},
                        child: Center(
                          child: Image.asset("/google.png", height: 50),
                        ),
                      ),

                      SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do not have an account?",
                            style: descriptionStyle,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            //go to register
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text(
                              "REGISTER",
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
                          dynamic result = await _auth.signInUsungEmailPassword(
                            email,
                            password,
                          );

                          if (result == null) {
                            setState(() {
                              error =
                                  "Could not sign in with these credentials";
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
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      GestureDetector(
                        onTap: () async {
                          await _auth.signAnonymously();
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
                              "LOGIN AS GUEST",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
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



// ElevatedButton(
//         onPressed: () async {
//           dynamic result = await _auth.signAnonymously();

//           if (result != Null) {
//             print("Sign In Anonymously");
//             print(result.uid);
//           } else {
//             print("Error In Anonymously");
//           }
//         },
//         child: Text("Sign In Anonymously"),
//       ),
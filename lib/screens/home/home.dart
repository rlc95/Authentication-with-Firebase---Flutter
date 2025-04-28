import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/description.dart';
import 'package:flutter_app/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //create object from authservices 
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgblck,
        appBar: AppBar(elevation: 0, backgroundColor: bgblck,
      actions: [ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(bgblck)),  onPressed: () async {
        await _auth.signOut();
      }, child: Icon(Icons.logout))],),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text("HOME", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
              SizedBox(height: 20,),
              Text(description, textAlign: TextAlign.center,
              style: TextStyle(color: textlight, fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20,),
              Center(child: Image.asset("/logoedt.png", height: 230)),
            ],
          ),
        ),
      ),

      ),
      
    );
  }
}
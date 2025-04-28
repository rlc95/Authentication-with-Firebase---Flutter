import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

   if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCwaqFo8Km6zjwHHoVeOn9ucAXChAQKGjg",
        authDomain: "authfirebase-1478d.firebaseapp.com",
        projectId: "authfirebase-1478d",
        storageBucket: "authfirebase-1478d.appspot.com",
        messagingSenderId: "788902822043",
        appId: "1:788902822043:android:61a24b07ed39644a57c63e",
        measurementId: "YOUR_MEASUREMENT_ID", // optional
      ),
    );
  } else {
    await Firebase.initializeApp(); // ✅ mobile initialization
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(initialData: UserModel(uid: ""), value: AuthServices().user,
    child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper(),),);
  }
}

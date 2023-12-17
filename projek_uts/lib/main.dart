import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:projek_uts/Login/home.dart';
// import 'package:projek_uts/view/homepage.dart';
import 'package:projek_uts/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAgQjzFgrQIGxJvLh_63OmfHlvdwjRB5q0',
          appId: '1:94619162799:android:ea786a430dc27f45675c5a',
          messagingSenderId: '94619162799',
          projectId: 'exercise-and-nutrition-api'));

  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {'/homepage': (context) => HomePage()},
    );
  }
}

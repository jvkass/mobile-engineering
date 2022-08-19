import 'package:bike_finder/firebase/authentication_gate.dart';
import 'package:bike_finder/firebase/firebase_options.dart';
import 'package:bike_finder/firebase/label_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const BikeFinderApp());
}

class BikeFinderApp extends StatelessWidget {
  const BikeFinderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FlutterFireUILocalizations.withDefaultOverrides(const LabelOverrides()),
      ],
      title: 'Bike Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationGate(),
    );
  }
}

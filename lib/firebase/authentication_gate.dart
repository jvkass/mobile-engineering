import 'package:bike_finder/pages/home_page.dart';
import 'package:bike_finder/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthenticationGate extends StatelessWidget {
  const AuthenticationGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providerConfigs: const [
                EmailProviderConfiguration(),
              ],
              headerBuilder: (context, constraints, _) {
                return const Logo();
              },
              footerBuilder: (context, action) {
                return const Text(
                  'By signing, you agree to our terms and conditions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                );
              },
            );
          }
          return HomePage(
            user: snapshot.data!,
          );
        });
  }
}

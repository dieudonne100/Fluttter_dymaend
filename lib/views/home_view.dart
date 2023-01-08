import 'package:flutter/material.dart';

import 'auth/signin_view.dart';
import 'auth/signupview.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenue sur Dyma',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade900,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
              child: const Text(
                "S'inscrire",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SignInView.routeName);
              },
              child: const Text(
                'Connexion',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

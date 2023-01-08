import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
    static String routeName = '/notfound';

  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        child: Center(
          child: Text(
            'Not found view',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

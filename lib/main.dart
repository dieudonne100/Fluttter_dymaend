import 'dart:convert';

import 'package:client/providers/auth_provider.dart';
import 'package:client/providers/user_provider.dart';
import 'package:client/views/auth/signin_view.dart';
import 'package:client/views/home_view.dart';
import 'package:client/views/not_found_view.dart';
import 'package:client/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/auth/signupview.dart';

void main() {
  runApp(const MyAuth());
}

class MyAuth extends StatefulWidget {
  const MyAuth({super.key});

  @override
  State<MyAuth> createState() => _MyAuthState();
}

class _MyAuthState extends State<MyAuth> {
  final AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    authProvider.initAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          create: (_) => UserProvider(),
          update: (_, authProvider, olduserProvider) {
            olduserProvider?.update(authProvider);
            return olduserProvider!;
          },
        ),
      ],
      child: MaterialApp(
        title: 'My auth',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SignInView(),
        onGenerateRoute: ((settings) {
          if (settings.name == SignInView.routeName) {
            return MaterialPageRoute(builder: (_) => const SignInView());
          } else if (settings.name == SignUpView.routeName) {
            return MaterialPageRoute(builder: (_) => const SignUpView());
          } else if (settings.name == ProfileView.routeName) {
            return MaterialPageRoute(builder: (_) => const ProfileView());
          }else if (settings.name == HomeView.routeName) {
            return MaterialPageRoute(builder: (_) => const HomeView());
          } else {
            return null;
          }
        }),
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (_) => const NotFoundView()),
      ),
    );
  }
}

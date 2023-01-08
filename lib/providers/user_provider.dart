import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import './auth_provider.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://localhost';
  late User user;
  late AuthProvider authProvider;

  void update(AuthProvider newAuthProvider) {
    authProvider = newAuthProvider;
    if (user == null && authProvider.isLoggedin) {
      fetchCurrentUser();
    }
  }

  Future<void> fetchCurrentUser() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$host/api/user/current'),
        headers: {'authorization': 'Bearer ${authProvider.token}'},
      );
      if (response.statusCode == 200) {
        updateUser(
          User.fromJson(
            json.decode(response.body),
          ),
        );
        
      }
    } catch (e) {
      rethrow;
    }
  }

  void updateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }
}

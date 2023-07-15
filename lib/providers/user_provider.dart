import 'package:flutter/material.dart';
import 'package:insta_clone/models/user_data.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  user? _user;
  final AuthMethods _authMethods = AuthMethods();
  user get getUser => _user!;

  Future<void> refreshUser() async {
    user tempUser = await _authMethods.getUserDetails();
    _user = tempUser;
    notifyListeners();
  }
}

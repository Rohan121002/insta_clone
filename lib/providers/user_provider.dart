import 'package:flutter/material.dart';
import 'package:insta_clone/models/user_data.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  //this is a normal user instance its private coz it may cause bugs as if its not private we can change it
  //from anyother path.
  user? _user;
  final AuthMethods _authMethods = AuthMethods();

  // get function is used to call the user from anywhere.
  user get getUser => _user!;

  Future<void> refreshUser() async {
    //Here we are putting the user into tempUser using the getUserDetails function in authMethods file.
    user tempUser = await _authMethods.getUserDetails();
    //passing the previously got tempUser into the actual model user which we have..
    _user = tempUser;
    //this will notify all the listners that the value of our global variable user has changed so please make changes.
    notifyListeners();
  }
}

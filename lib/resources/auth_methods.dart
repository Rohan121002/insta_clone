import "dart:typed_data";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:insta_clone/models/user_data.dart" as model;
import "package:insta_clone/resources/storage_method.dart";

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //This function is created for user_provider to get the userdetails in the form of user model object.
  Future<model.user> getUserDetails() async {
    //Here we are using currentUser method if firebase auth to get the instance of user into User provided by flutter.
    User currentUser = _auth.currentUser!;
    //Getting the one time instance(snapshot) of the user detils of the current user.
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    //fromsnap is used to convert the Documentsnapshot to a user model object
    return model.user.fromSnap(snap);
  }

  //user signup
  Future<String?> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStrange('profilepics', file, false);

        print(cred.user!.uid);
        model.user user = model.user(
            username: username,
            email: email,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            bio: bio,
            followers: [],
            following: []);
        //Add the above creden to the database
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // logging in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter the email";
      }
    } catch (e) {}
    return res;
  }
}

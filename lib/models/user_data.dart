import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class user {
  final String email;
  final String username;
  final String uid;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;

  const user({
    required this.username,
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };

// this function convert the Dcumentsnapshot to user model it is user for provider to get user object with useer detials from
//auth methods file/
  static user fromSnap(DocumentSnapshot snap) {
    // as map is a subtype of object we convert object(snap.data) to map.
    var snapshot = snap.data() as Map<String, dynamic>;
    return user(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      bio: snapshot['bio'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}

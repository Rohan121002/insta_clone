import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Post {
  final String description;
  final String username;
  final String uid;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.username,
    required this.description,
    required this.uid,
    required this.postId,
    required this.postUrl,
    required this.datePublished,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'description': description,
        'postId': postId,
        'postUrl': postUrl,
        'datePublished': datePublished,
        'profImage': profImage,
        'likes': likes,
      };

// this function convert the Dcumentsnapshot to user model it is user for provider to get user object with useer detials from
//auth methods file/
  static Post fromSnap(DocumentSnapshot snap) {
    // as map is a subtype of object we convert object(snap.data) to map.
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      datePublished: snapshot['datePublished'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
    );
  }
}

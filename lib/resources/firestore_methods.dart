import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload the post
  Future<String> uploadPost(String desc, Uint8List file, String uid,
      String username, String profileImage) async {
    String res = "Some error Occured";
    try {
      //this iso storre image to the firebase storage.

      //this uploadimagetostrange gives a url which we can store in post collection.
      String photoUrl =
          await StorageMethods().uploadImageToStrange('posts', file, true);

      //We create a unique id to for the post using Uuid package so that the post can be uniquely differentiated.
      String postId = const Uuid().v1();
      Post post = Post(
        description: desc,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profileImage,
        likes: [],
      );

      //converting post object to map which stores the details of the post in post collection.
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

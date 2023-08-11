import "dart:typed_data";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
import "package:uuid/uuid.dart";

class StorageMethods {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //adding image to firebase storage
  Future<String> uploadImageToStrange(
      String childName, Uint8List file, bool isPost) async {
    Reference ref = _firebaseStorage
        .ref()
        .child(childName)
        .child(_firebaseAuth.currentUser!.uid);

    //IF its a post as a user can upload muliple posts we cant have uid as unique identifier so we made a unique id and
    //passed it in as child'
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }
}

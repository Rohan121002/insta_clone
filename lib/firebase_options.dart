// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDq5RZUpXByAdCAfcLaQ-qcIg5usiJLXiE',
    appId: '1:1084883472368:web:8744c465eb0bfee1d29735',
    messagingSenderId: '1084883472368',
    projectId: 'insta-clone-3062f',
    authDomain: 'insta-clone-3062f.firebaseapp.com',
    databaseURL: 'https://insta-clone-3062f-default-rtdb.firebaseio.com',
    storageBucket: 'insta-clone-3062f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZCxWmgGBOFFdV2TodOIjGEdOe2aDuqoM',
    appId: '1:1084883472368:android:911136ad71371790d29735',
    messagingSenderId: '1084883472368',
    projectId: 'insta-clone-3062f',
    databaseURL: 'https://insta-clone-3062f-default-rtdb.firebaseio.com',
    storageBucket: 'insta-clone-3062f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM1259eqBz2fdJnza_9iRsngn_6yzCEv0',
    appId: '1:1084883472368:ios:b4706a7c0a446792d29735',
    messagingSenderId: '1084883472368',
    projectId: 'insta-clone-3062f',
    databaseURL: 'https://insta-clone-3062f-default-rtdb.firebaseio.com',
    storageBucket: 'insta-clone-3062f.appspot.com',
    iosClientId: '1084883472368-hck98q02tlojncu111ktv93ipit9karo.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAM1259eqBz2fdJnza_9iRsngn_6yzCEv0',
    appId: '1:1084883472368:ios:80e11bdc8de520ecd29735',
    messagingSenderId: '1084883472368',
    projectId: 'insta-clone-3062f',
    databaseURL: 'https://insta-clone-3062f-default-rtdb.firebaseio.com',
    storageBucket: 'insta-clone-3062f.appspot.com',
    iosClientId: '1084883472368-h2p48elegac9jrek7qb5tt59nhfd7pq5.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaClone.RunnerTests',
  );
}

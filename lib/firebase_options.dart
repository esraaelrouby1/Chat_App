// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCyGf6aEeYDUmAkC1B4Vybyb8Yb_VFAqwQ',
    appId: '1:617821458031:web:19c06661247d56bc77079a',
    messagingSenderId: '617821458031',
    projectId: 'chat-app-60de3',
    authDomain: 'chat-app-60de3.firebaseapp.com',
    storageBucket: 'chat-app-60de3.firebasestorage.app',
    measurementId: 'G-31LCSGHS06',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_9xHfQaV8o6MOI885Dd78bAQ-5Cqel-I',
    appId: '1:617821458031:android:db5c7eccd3d0d22577079a',
    messagingSenderId: '617821458031',
    projectId: 'chat-app-60de3',
    storageBucket: 'chat-app-60de3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUoxYGbU3a2RnTGS9F5xGqgRUGJswjopU',
    appId: '1:617821458031:ios:89816c03024d741e77079a',
    messagingSenderId: '617821458031',
    projectId: 'chat-app-60de3',
    storageBucket: 'chat-app-60de3.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

}
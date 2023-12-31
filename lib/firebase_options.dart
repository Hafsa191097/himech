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
    apiKey: 'AIzaSyBJIdYoAibkMmRV3uBzbGxzqV6jVe2tdUc',
    appId: '1:161158754674:web:6562d707bc0d2520fdadeb',
    messagingSenderId: '161158754674',
    projectId: 'himech-14151',
    authDomain: 'himech-14151.firebaseapp.com',
    storageBucket: 'himech-14151.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj4UgmT69QViDcYqt_EtHIvuLnjq6zkzM',
    appId: '1:161158754674:android:82d51d60d507cfc1fdadeb',
    messagingSenderId: '161158754674',
    projectId: 'himech-14151',
    storageBucket: 'himech-14151.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0lMI96QLxZ3I3K_6WdL0nFBA5uyH9bCw',
    appId: '1:161158754674:ios:b60b89c08b0e7e0ffdadeb',
    messagingSenderId: '161158754674',
    projectId: 'himech-14151',
    storageBucket: 'himech-14151.appspot.com',
    iosClientId: '161158754674-il0nev8nhufist8q8dk977iim39qq75c.apps.googleusercontent.com',
    iosBundleId: 'com.example.himech',
  );
}

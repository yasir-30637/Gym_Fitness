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
    apiKey: 'AIzaSyBHSxe-nIzWr7CzoDYr1zp_COz5RQp8VRI',
    appId: '1:850738327498:web:f9a297157eb206a336a933',
    messagingSenderId: '850738327498',
    projectId: 'final-project-e1884',
    authDomain: 'final-project-e1884.firebaseapp.com',
    storageBucket: 'final-project-e1884.appspot.com',
    measurementId: 'G-WGHZ2ET04G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqtdW9rKn8ORAfM2wQN1F0gljKh4DO6XM',
    appId: '1:850738327498:android:fff2a6f5b1814cc136a933',
    messagingSenderId: '850738327498',
    projectId: 'final-project-e1884',
    storageBucket: 'final-project-e1884.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7LGjQNlx0lmKwBE1h1ZR4zt_n_zxxoiA',
    appId: '1:850738327498:ios:201dd5981382e08f36a933',
    messagingSenderId: '850738327498',
    projectId: 'final-project-e1884',
    storageBucket: 'final-project-e1884.appspot.com',
    iosBundleId: 'com.example.projectnew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7LGjQNlx0lmKwBE1h1ZR4zt_n_zxxoiA',
    appId: '1:850738327498:ios:556c2f13d1f452cc36a933',
    messagingSenderId: '850738327498',
    projectId: 'final-project-e1884',
    storageBucket: 'final-project-e1884.appspot.com',
    iosBundleId: 'com.example.projectnew.RunnerTests',
  );
}

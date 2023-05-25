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
    apiKey: 'AIzaSyC1jtQyaxok7hDakzwe1KCN1x8wmMFzEKA',
    appId: '1:856384299226:web:1fe9896b8a1fa7c82cc5e3',
    messagingSenderId: '856384299226',
    projectId: 'voyage-94fde',
    authDomain: 'voyage-94fde.firebaseapp.com',
    storageBucket: 'voyage-94fde.appspot.com',
    measurementId: 'G-KFWJ1P23FB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLG4SVv1gbzlcSe1xxiEehJQic4o_e-TQ',
    appId: '1:856384299226:android:2d25a9f3e43dfd5e2cc5e3',
    messagingSenderId: '856384299226',
    projectId: 'voyage-94fde',
    storageBucket: 'voyage-94fde.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqOmqnurpXNrEysfb9e5uh6fbrREtmLg8',
    appId: '1:856384299226:ios:91ab1b9482e291642cc5e3',
    messagingSenderId: '856384299226',
    projectId: 'voyage-94fde',
    storageBucket: 'voyage-94fde.appspot.com',
    iosClientId: '856384299226-jnploosj79kasr3sf7t3bbpd15mpfa49.apps.googleusercontent.com',
    iosBundleId: 'com.example.testIkram',
  );
}

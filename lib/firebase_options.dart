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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAMyNSmaEBY6xZIiVgEYCzVi_fp3s7UgSg',
    appId: '1:436714118717:web:90a30fd734687002e9d454',
    messagingSenderId: '436714118717',
    projectId: 'letterbook-8c51f',
    authDomain: 'letterbook-8c51f.firebaseapp.com',
    storageBucket: 'letterbook-8c51f.appspot.com',
    measurementId: 'G-WWQ84MS8RN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3dgDuhD86GDO8cDdhBPpeUXimu-nSRwE',
    appId: '1:436714118717:android:2585670b2205665ce9d454',
    messagingSenderId: '436714118717',
    projectId: 'letterbook-8c51f',
    storageBucket: 'letterbook-8c51f.appspot.com',
  );
}

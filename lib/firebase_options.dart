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
    apiKey: 'AIzaSyChd2we5HgmUXqAfdmSlKSb6dywy8DU6lY',
    appId: '1:657406810852:web:fa29a7c687eeb874da2af1',
    messagingSenderId: '657406810852',
    projectId: 'dam1-cior',
    authDomain: 'dam1-cior.firebaseapp.com',
    storageBucket: 'dam1-cior.appspot.com',
    measurementId: 'G-MZ2GEKDFYX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDi_zdqbBq6F6MIXSonjh6HEuqp-doIrzU',
    appId: '1:657406810852:android:4c31cb4f8ad1884bda2af1',
    messagingSenderId: '657406810852',
    projectId: 'dam1-cior',
    storageBucket: 'dam1-cior.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMYfJiJS8D7O6NuNfV5JTLmjCsOKKn_PA',
    appId: '1:657406810852:ios:5f8cd0830bc25b56da2af1',
    messagingSenderId: '657406810852',
    projectId: 'dam1-cior',
    storageBucket: 'dam1-cior.appspot.com',
    iosClientId: '657406810852-svgv2hu2l0ugq7dc994o059qodrpgkg7.apps.googleusercontent.com',
    iosBundleId: 'mx.edu.ittepic.damU4Proyecto119400633',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMYfJiJS8D7O6NuNfV5JTLmjCsOKKn_PA',
    appId: '1:657406810852:ios:5f8cd0830bc25b56da2af1',
    messagingSenderId: '657406810852',
    projectId: 'dam1-cior',
    storageBucket: 'dam1-cior.appspot.com',
    iosClientId: '657406810852-svgv2hu2l0ugq7dc994o059qodrpgkg7.apps.googleusercontent.com',
    iosBundleId: 'mx.edu.ittepic.damU4Proyecto119400633',
  );
}

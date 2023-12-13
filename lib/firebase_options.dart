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
    apiKey: 'AIzaSyDKwY5Tc_y_nocMW1TyUOpLt0VZI-h1FzE',
    appId: '1:1008775514502:web:64a4520a06c8758cd30407',
    messagingSenderId: '1008775514502',
    projectId: 'result-88513',
    authDomain: 'result-88513.firebaseapp.com',
    storageBucket: 'result-88513.appspot.com',
    measurementId: 'G-P3RSSYSPK3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0QTX3rtj58_yAdkwGiGcsQTP5M485iS4',
    appId: '1:1008775514502:android:263bea9e41f8d64fd30407',
    messagingSenderId: '1008775514502',
    projectId: 'result-88513',
    storageBucket: 'result-88513.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAoNkQGTVnYHP0BeSO8VkkiyZjV_UcE2w',
    appId: '1:1008775514502:ios:cb5367335b517235d30407',
    messagingSenderId: '1008775514502',
    projectId: 'result-88513',
    storageBucket: 'result-88513.appspot.com',
    androidClientId: '1008775514502-958dml7vt93qgv0rm2d73ea2jr0kq2qe.apps.googleusercontent.com',
    iosClientId: '1008775514502-brcv1tibg4l9fto05neuadeihv6vlbpj.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterCalculator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAoNkQGTVnYHP0BeSO8VkkiyZjV_UcE2w',
    appId: '1:1008775514502:ios:cb5367335b517235d30407',
    messagingSenderId: '1008775514502',
    projectId: 'result-88513',
    storageBucket: 'result-88513.appspot.com',
    androidClientId: '1008775514502-958dml7vt93qgv0rm2d73ea2jr0kq2qe.apps.googleusercontent.com',
    iosClientId: '1008775514502-brcv1tibg4l9fto05neuadeihv6vlbpj.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterCalculator',
  );
}
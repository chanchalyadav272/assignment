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
    apiKey: 'AIzaSyCOFv8peTQSeysIMU7Wzb63WFq_UL5vJSg',
    appId: '1:175973484308:web:559d8ca115bd2a384ae401',
    messagingSenderId: '175973484308',
    projectId: 'reva-assignment',
    authDomain: 'reva-assignment.firebaseapp.com',
    storageBucket: 'reva-assignment.appspot.com',
    measurementId: 'G-E4Y56YGB98',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpm6tjos6pjZt7PAOj1UI72ATH7yJ8lnc',
    appId: '1:175973484308:android:eda31d34f86b10294ae401',
    messagingSenderId: '175973484308',
    projectId: 'reva-assignment',
    storageBucket: 'reva-assignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJ6yw0-TDNTwtp-AJv5tQHi8t1jV1Gq2I',
    appId: '1:175973484308:ios:375ad22a9d231e864ae401',
    messagingSenderId: '175973484308',
    projectId: 'reva-assignment',
    storageBucket: 'reva-assignment.appspot.com',
    iosClientId: '175973484308-nt65mf0osue562nn9spit72rnr65qu7m.apps.googleusercontent.com',
    iosBundleId: 'com.y.chanchal.assignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJ6yw0-TDNTwtp-AJv5tQHi8t1jV1Gq2I',
    appId: '1:175973484308:ios:375ad22a9d231e864ae401',
    messagingSenderId: '175973484308',
    projectId: 'reva-assignment',
    storageBucket: 'reva-assignment.appspot.com',
    iosClientId: '175973484308-nt65mf0osue562nn9spit72rnr65qu7m.apps.googleusercontent.com',
    iosBundleId: 'com.y.chanchal.assignment',
  );
}

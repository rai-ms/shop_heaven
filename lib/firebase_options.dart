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
    apiKey: 'AIzaSyCW5W5nD5SJKEP7omPnwvDfrnUjTOB1x-A',
    appId: '1:478829532994:web:57229bef9dfb948e501adb',
    messagingSenderId: '478829532994',
    projectId: 'shop-heaven-ed8be',
    authDomain: 'shop-heaven-ed8be.firebaseapp.com',
    storageBucket: 'shop-heaven-ed8be.appspot.com',
    measurementId: 'G-CZ4R9EPEC9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDebH6KTanHk3TusSZxXgjyrolki8FbKxQ',
    appId: '1:478829532994:android:ed900799af180925501adb',
    messagingSenderId: '478829532994',
    projectId: 'shop-heaven-ed8be',
    storageBucket: 'shop-heaven-ed8be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaIdsV5IYZWKzzIy4Z1NAtTj5PJCVkkRA',
    appId: '1:478829532994:ios:eb302f40dfdc56f9501adb',
    messagingSenderId: '478829532994',
    projectId: 'shop-heaven-ed8be',
    storageBucket: 'shop-heaven-ed8be.appspot.com',
    iosBundleId: 'com.appinventiv.ashish.shopheaven.shopHeaven',
  );
}

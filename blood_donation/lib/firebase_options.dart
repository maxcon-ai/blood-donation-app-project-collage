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
    apiKey: 'AIzaSyC87xlBhXv7AiIAJ9VnCa3fTVaMo29NGg4',
    appId: '1:260055524755:web:1614d385da4f28ee30f466',
    messagingSenderId: '260055524755',
    projectId: 'blooddonation-f6b4b',
    authDomain: 'blooddonation-f6b4b.firebaseapp.com',
    storageBucket: 'blooddonation-f6b4b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDW9KvRlL_j0RUJUZDV5_Vj1UOfIlqmMn8',
    appId: '1:260055524755:android:f8099215395eccb130f466',
    messagingSenderId: '260055524755',
    projectId: 'blooddonation-f6b4b',
    storageBucket: 'blooddonation-f6b4b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7ez6IAOapwXAtr3PAbKkrH66JTZweKno',
    appId: '1:260055524755:ios:c6d45e6fcae2f62d30f466',
    messagingSenderId: '260055524755',
    projectId: 'blooddonation-f6b4b',
    storageBucket: 'blooddonation-f6b4b.appspot.com',
    iosClientId: '260055524755-hqd1ne691bka2714apg5s6gbbcm40tjh.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD7ez6IAOapwXAtr3PAbKkrH66JTZweKno',
    appId: '1:260055524755:ios:c6d45e6fcae2f62d30f466',
    messagingSenderId: '260055524755',
    projectId: 'blooddonation-f6b4b',
    storageBucket: 'blooddonation-f6b4b.appspot.com',
    iosClientId: '260055524755-hqd1ne691bka2714apg5s6gbbcm40tjh.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonation',
  );
}

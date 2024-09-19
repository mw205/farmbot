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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIfx45WQfAiMHu4p7lteIxvLzrflwduiU',
    appId: '1:780060955651:android:6c128d01aa03ddad2fea36',
    messagingSenderId: '780060955651',
    projectId: 'farmbot-30369',
    storageBucket: 'farmbot-30369.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdjAkJAyCNEzXFbxTry3L1i5Lgz-1tb5E',
    appId: '1:780060955651:ios:945b029b1321e9702fea36',
    messagingSenderId: '780060955651',
    projectId: 'farmbot-30369',
    storageBucket: 'farmbot-30369.appspot.com',
    androidClientId: '780060955651-u1ljq8l82qaek2olih96c7tmai9mmj4p.apps.googleusercontent.com',
    iosClientId: '780060955651-1j09j1fpv94v31p9snqek9o3ghtcjer8.apps.googleusercontent.com',
    iosBundleId: 'com.bot.farmbot',
  );

}
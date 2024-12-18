import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyARkTBqJUIYzNI_MiSLv4VI8OFFQjlLcs8",
            authDomain: "curb-alert-sqkv43.firebaseapp.com",
            projectId: "curb-alert-sqkv43",
            storageBucket: "curb-alert-sqkv43.appspot.com",
            messagingSenderId: "306021565398",
            appId: "1:306021565398:web:16c24c8f454cd49ed3da77",
            measurementId: "G-Q71RBGQVHS"));
  } else {
    await Firebase.initializeApp();
  }
}

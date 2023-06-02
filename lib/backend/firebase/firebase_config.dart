import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC7DkvP6iXig6Km_c-8TqiH2m1YCHJrHzM",
            authDomain: "ne-olsun.firebaseapp.com",
            projectId: "ne-olsun",
            storageBucket: "ne-olsun.appspot.com",
            messagingSenderId: "438285478643",
            appId: "1:438285478643:web:0d3282258c4bdee2f0e586",
            measurementId: "G-0D2NM14PQ2"));
  } else {
    await Firebase.initializeApp();
  }
}

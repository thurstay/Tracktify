import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKUG4awkMQ1uGKNqWJvxsty0fmOYgvqz4",
            authDomain: "tracktify-r4zvfj.firebaseapp.com",
            projectId: "tracktify-r4zvfj",
            storageBucket: "tracktify-r4zvfj.appspot.com",
            messagingSenderId: "589329323582",
            appId: "1:589329323582:web:79de0cbc7983cba4d5636f"));
  } else {
    await Firebase.initializeApp();
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBCspCJDecWxmoLVQ6jzjz7E3SHX8FXT7o",
            authDomain: "tradingwheels-2d58b.firebaseapp.com",
            projectId: "tradingwheels-2d58b",
            storageBucket: "tradingwheels-2d58b.appspot.com",
            messagingSenderId: "440981034476",
            appId: "1:440981034476:web:203e160f51595c96bc1cc9",
            measurementId: "G-SKYC4103KK"));
  } else {
    await Firebase.initializeApp();
  }
}

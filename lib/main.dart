import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/assets/colors.dart';
import 'package:instagram_clone/assets/constants.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCbzhkXX6QYFVZoKSR04JfQyS4HyB2-bh4",
            projectId: "instagram-clone-f3f4c",
            storageBucket: "instagram-clone-f3f4c.appspot.com",
            messagingSenderId: "1082762983465",
            appId: "1:1082762983465:web:c18a48e11253892bbd4438"));
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCbzhkXX6QYFVZoKSR04JfQyS4HyB2-bh4",
            projectId: "instagram-clone-f3f4c",
            storageBucket: "instagram-clone-f3f4c.appspot.com",
            messagingSenderId: "1082762983465",
            appId: "1:1082762983465:web:c18a48e11253892bbd4438"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstatns.appName,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignupScreen(),
    );
  }
}

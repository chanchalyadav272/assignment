import 'dart:async';

import 'package:assignment/firebase_options.dart';
import 'package:assignment/src/screens/login_screen.dart';
import 'package:assignment/src/utils/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(Authentication()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {



    return  GetMaterialApp(

      debugShowCheckedModeBanner:  false,

      title: 'Rev Assignment',

      home: Login()    );
  }
}



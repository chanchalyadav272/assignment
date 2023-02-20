
import 'package:assignment/src/screens/home_screen.dart';
import 'package:assignment/src/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class Authentication extends GetxController{
  static Authentication get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> user;
  String errorMessage = "";

  @override
  void onReady() {
    user = Rx<User?>(_auth.currentUser);
    user.bindStream(_auth.userChanges());
    ever(user, _setInitalScreen);
    
  }

  _setInitalScreen(User? user) {
    user == null ? Get.off(()=> const Login()) : Get.off(()=>  Home());
    FlutterNativeSplash.remove();

  }

  Future<void> signup(String email,String password ) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(error){

      switch (error.code) {
              case "invalid-email":
                errorMessage = "Your email address appears to be malformed.";
                break;
              case "wrong-password":
                errorMessage = "Your password is wrong.";
                break;
              case "user-not-found":
                errorMessage = "User with this email doesn't exist.";
                break;
              case "user-disabled":
                errorMessage = "User with this email has been disabled.";
                break;
              case "too-many-requests":
                errorMessage = "Too many requests";
                break;
              case "operation-not-allowed":
                errorMessage = "Signing in with Email and Password is not enabled.";
                break;
              default:
                errorMessage = "An undefined Error happened.";
            }
            Get.snackbar("Sign up failed", errorMessage);
      if (kDebugMode) {
      print(error);
    }}
  }


  Future<void> signin(String email, String password) async{
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid)
    {Get.snackbar("Login Successful", "");
      Get.off(()=>  Home());
    });
  }
  on FirebaseAuthException catch(error){
    switch (error.code) {
            case "invalid-email":
              errorMessage = "Your email address appears to be malformed.";

              break;
            case "wrong-password":
              errorMessage = "Your password is wrong.";
              break;
            case "user-not-found":
              errorMessage = "User with this email doesn't exist.";
              break;
            case "user-disabled":
              errorMessage = "User with this email has been disabled.";
              break;
            case "too-many-requests":
              errorMessage = "Too many requests";
              break;
            case "operation-not-allowed":
              errorMessage = "Signing in with Email and Password is not enabled.";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          Get.snackbar("Login failed", errorMessage);

    if (kDebugMode) {
      print(error);
    }
  }
  }
  Future<void> signout() async{
    try{
      await _auth.signOut().then((value) => Get.snackbar("Logout Successful", ""));
    }
    on FirebaseAuthException catch(e){
      Get.snackbar("An unknown error occurred", "");
      

      if (kDebugMode) {
        print(e);
      }
    }
  }


}
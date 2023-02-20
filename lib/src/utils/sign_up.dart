import 'package:assignment/src/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();



  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final collegecontroller = TextEditingController();
  final yearcontroller = TextEditingController();
  final ListItems = ['Student', 'Faculty','Alumni'];
  var value = '';

void signUp(String email, String password) async {
  Authentication.instance.signup(email, password  );
}
}
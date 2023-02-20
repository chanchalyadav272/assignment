import 'package:assignment/src/models/usermodel.dart';
import 'package:assignment/src/utils/authentication.dart';
import 'package:assignment/src/utils/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();

  final repo  =Get.put(UserRep());



  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final collegecontroller = TextEditingController();
  final yearcontroller = TextEditingController();
  final ListItems = ['Student', 'Faculty','Alumni'];
  var type = '';

void signUp(String email, String password) async {
  Authentication.instance.signup(email, password  );
}
  void createUser(UserModel userModel) async {
    await repo.createUser(userModel);
    signUp(userModel.email, userModel.password);
  }
}
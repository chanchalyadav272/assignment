import 'package:assignment/src/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRep extends GetxController {
  static UserRep get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel userModel) async {
    await _db.collection("Users").add(userModel.toJson()).whenComplete(
        () => Get.snackbar("Success", "Your account has been created")).catchError((error, stackTrace){
          Get.snackbar("Error", "Something went wrong");
    });
    //
    // Future<UserModel> getUserDetails(String email) async {
    //   final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    //   final userData = snapshot.docs.map((DocumentSnapshot<Map<String,dynamic>> e) => UserModel.fromSnapshot(e)).single;
    //   return userData;
    // }
  }
}

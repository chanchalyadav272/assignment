

class UserModel {
  final String? uid;
  final String userType;
  final String email;
  final String password;
  final String name;
  final String mobile;
  final String collegeName;
  final String? year;
  // final File profilePic;
  // final File resume;

  const UserModel({
    this.uid,
    required this.userType,
    required this.email,
    required this.password,
    required this.name,
    required this.mobile,
    required this.collegeName,
    this.year,
    // required this.profilePic,
    // required this.resume,
  });

  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
      "Mobile": mobile,
      "College": collegeName,
      "UserType": userType,
      "Year": year,
    };
  }

  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
  //   final data = document.data();
  //   return UserModel(
  //       uid: document.id,
  //       userType: data["UserType"],
  //       email: data["Email"],
  //       password: data["Password"],
  //       name: data["Name"],
  //       mobile: data["Mobile"],
  //       collegeName: data["College"],
  //   year: data["Year"]);
  // }
}

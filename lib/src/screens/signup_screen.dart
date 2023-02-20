import 'dart:io';

import 'package:assignment/src/models/usermodel.dart';
import 'package:assignment/src/utils/sign_up.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/appbar.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());


  @override

  Widget build(BuildContext context) {
    late File image;
    Future imagePicker() async{
     try{
       final img =  await ImagePicker().pickImage(source: ImageSource.gallery);
       setState(() {
         if(img != null){
           image = File(img.path);
           Get.snackbar("Success", "image selected");
         }
         else{
           Get.snackbar("Error", "No image selected");
         }
       });
     }
     catch(e){
       Get.snackbar("Error", e.toString());
     }
    }
    Future uploadImage() async{
      Reference ref = FirebaseStorage.instance.ref().child('images').child('${SignUpController.instance.namecontroller.text.trim()}');
     await ref.putFile(image);


    }

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56), child: Appbar()),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/try.jpg'), fit: BoxFit.fill)),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Container(
                        height: controller.type == 'Faculty' ? 600 : 600,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white70),
                      ),
                    ),

                    // Expanded(flex: 2,child: Container())
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 75,
                          ),
                          Text(
                            "Create a new account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Form(
                        key: _formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: DropdownButtonFormField(
                                    items: controller.ListItems.map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      );
                                    }).toList(),
                                    onChanged: (Object? value) {
                                      controller.type = value.toString();
                                      if (kDebugMode) {
                                        print(controller.type);
                                      }
                                      setState(() {});
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'User Type',
                                        prefixIcon: Icon(
                                          Icons.menu,
                                          size: 24,
                                          color: Colors.black38,
                                        ),
                                        hintStyle: TextStyle(fontSize: 16)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                        hintText: 'Email',
                                        alignLabelWithHint: true,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          size: 24,
                                          color: Colors.black38,
                                        ),
                                        hintStyle: TextStyle(fontSize: 16)),
                                    controller: controller.emailcontroller,
                                    keyboardType: TextInputType.emailAddress,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      controller.emailcontroller.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter your email");
                                      }
                                      // reg expression for email validation
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid email");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                        hintText: 'Mobile Number',
                                        alignLabelWithHint: true,
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          size: 24,
                                          color: Colors.black38,
                                        ),
                                        hintStyle: TextStyle(fontSize: 16)),
                                    controller: controller.mobilecontroller,
                                    keyboardType: TextInputType.number,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      controller.mobilecontroller.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter your mobile number");
                                      }
                                      // reg expression for email validation
                                      if (!RegExp("^[0-9]").hasMatch(value) ||
                                          value.length != 10) {
                                        return ("Please Enter a valid mobile number");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                      hintText: 'Password',
                                      alignLabelWithHint: true,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 24,
                                        color: Colors.black38,
                                      ),
                                      hintStyle: TextStyle(fontSize: 16)),
                                  controller: controller.passwordcontroller,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password is required for login");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Password(Min. 6 Character)");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    controller.passwordcontroller.text = value!;
                                  },
                                  obscureText: true,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                        hintText: 'Name',
                                        alignLabelWithHint: true,
                                        prefixIcon: Icon(
                                          Icons.person_outline,
                                          size: 24,
                                          color: Colors.black38,
                                        ),
                                        hintStyle: TextStyle(fontSize: 16)),
                                    controller: controller.namecontroller,
                                    keyboardType: TextInputType.text,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      controller.namecontroller.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter your college name");
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                        hintText: 'College Name',
                                        alignLabelWithHint: true,
                                        prefixIcon: Icon(
                                          Icons.school_outlined,
                                          size: 24,
                                          color: Colors.black38,
                                        ),
                                        hintStyle: TextStyle(fontSize: 16)),
                                    controller: controller.collegecontroller,
                                    keyboardType: TextInputType.text,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      controller.collegecontroller.text =
                                          value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter your college name");
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              controller.type != 'Faculty'
                                  ? Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: TextFormField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              hintText:
                                                  controller.type == 'Student'
                                                      ? 'Admission year'
                                                      : 'Passout year',
                                              alignLabelWithHint: true,
                                              prefixIcon: const Icon(
                                                Icons.date_range,
                                                size: 24,
                                                color: Colors.black38,
                                              ),
                                              hintStyle: const TextStyle(
                                                  fontSize: 16)),
                                          controller: controller.yearcontroller,
                                          keyboardType: TextInputType.number,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          textInputAction: TextInputAction.next,
                                          onSaved: (value) {
                                            controller.yearcontroller.text =
                                                value!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return controller.type ==
                                                      'Student'
                                                  ? ("Please enter your admission year")
                                                  : ("Please enter your passout year");
                                            }
                                            if (value.length != 4) {
                                              return ("Please enter a valid year");
                                            }

                                            return null;
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(),
                              controller.type != 'Faculty'
                                  ? const SizedBox(
                                      height: 8,
                                    )
                                  : Container(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      imagePicker().whenComplete(() => uploadImage());
                                    },
                                    child: Container(

                                      decoration: const BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      height: 45,
                                      alignment: Alignment.center,
                                      child: const Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 16,),
                                        child: Text("Select profile pic"),

                                      ),
                                    ),

                                  ),
                                  GestureDetector(
                                    onTap: ((){}),
                                    child: Container(

                                      decoration: const BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      height: 45,
                                      alignment: Alignment.center,
                                      child: const Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 16,),
                                        child: Text("Select resume"),

                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        final userModel = UserModel(
                                            userType:
                                                SignUpController.instance.type,
                                            email: SignUpController
                                                .instance.emailcontroller.text
                                                .trim(),
                                            password: SignUpController.instance
                                                .passwordcontroller.text
                                                .trim(),
                                            name: SignUpController
                                                .instance.namecontroller.text
                                                .trim(),
                                            mobile: SignUpController
                                                .instance.mobilecontroller.text
                                                .trim(),
                                            collegeName: SignUpController
                                                .instance.collegecontroller.text
                                                .trim(),
                                            year: SignUpController
                                                .instance?.yearcontroller.text
                                                .trim(),
                                       );
                                        SignUpController.instance
                                            .createUser(userModel);
                                      }

                                      if (kDebugMode) {
                                        print("Sign up");
                                      }
                                    },
                                    style: const ButtonStyle(),
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 16,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have an account?  ",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    GestureDetector(
                                      child: const Text(
                                        'Sign In',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      ),
                                      onTap: () {
                                        if (kDebugMode) {
                                          print('sign in');
                                        }
                                        Get.off(Login());
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

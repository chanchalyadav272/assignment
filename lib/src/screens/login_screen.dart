import 'package:assignment/src/screens/signup_screen.dart';
import 'package:assignment/src/utils/authentication.dart';
import 'package:assignment/src/widgets/appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // final _auth = FirebaseAuth.instance;
  // Stream<User?> get authChange => _auth.authStateChanges();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56), child: Appbar()),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/try.jpg'),
                  fit: BoxFit.fill
              )

          ),
          child: Center(
            child: Stack(
              // fit : StackFit.expand,
              children:<Widget> [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Container(
                            height: 400,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white70
                            ),


                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>  [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height:75,),
                            Text("Welcome Back",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold

                              ),),
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
                                      borderRadius: BorderRadius.all(Radius.circular(10))

                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: const InputDecoration(
                                          hintText: 'Email',
                                          alignLabelWithHint: true,
                                          prefixIcon: Icon(Icons.email_outlined,
                                            size: 24,
                                            color: Colors.black38,),
                                          hintStyle: TextStyle(
                                              fontSize: 16
                                          )
                                      ),
                                      controller: emailcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      onSaved: (value){
                                        emailcontroller.text = value!;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("Please enter your email");
                                        }
                                        // reg expression for email validation
                                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Please Enter a valid email");
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: const BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.all(Radius.circular(10))

                                  ),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                        hintText: 'Password',
                                        alignLabelWithHint: true,
                                        prefixIcon: Icon(Icons.lock,
                                          size: 24,
                                          color: Colors.black38,),
                                        hintStyle: TextStyle(
                                            fontSize: 16
                                        )
                                    ),
                                    controller: passwordcontroller,
                                    keyboardType: TextInputType.text,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                      passwordcontroller.text = value!;
                                    },
                                    obscureText: true,
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                SizedBox(
                                  height: 16,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: const Text('Forgot password?',
                                          style: TextStyle(
                                              color: Colors.redAccent
                                          ),),
                                        onTap: (){
                                          if (kDebugMode) {
                                            print('forgot password');
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40,),
                                SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        Authentication.instance.signin(emailcontroller.text.trim(), passwordcontroller.text.trim());
                                        Get.off( Home());
                                        if (kDebugMode) {
                                          print("Signed In");
                                        }
                                      },


                                      // Navigator.pushNamed(context, '/home');

                                      style: const ButtonStyle(

                                      ),
                                      child: const Text("Sign In",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),)),
                                ),
                                const SizedBox(height: 40,),
                                SizedBox(
                                  height: 16,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account?  ",
                                        style: TextStyle(
                                            color: Colors.black54
                                        ),),
                                      GestureDetector(
                                        child: const Text('Create an account',
                                          style: TextStyle(
                                              color: Colors.blueAccent
                                          ),
                                        ),
                                        onTap: (){
                                          if (kDebugMode) {
                                            print('create a new account');
                                          }
                                          Get.to(const SignUp());
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
      ),
    );
  }
}

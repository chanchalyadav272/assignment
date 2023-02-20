import 'package:assignment/src/utils/authentication.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
    preferredSize: Size.fromHeight(56), child: Appbar()),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children:  [
                ListTile(
                leading: const Text("Email:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                  trailing: Text(Authentication.instance.user.value!.email.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                )),
              ListTile(
                  leading: const Text("Mobile number:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                  trailing: Text(Authentication.instance.user.value!.email.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                  )),
              ListTile(
                  leading: const Text("User type:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                  trailing: Text(Authentication.instance.user.value!.email.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                  )),
              ListTile(
                  leading: const Text("Email:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                  trailing: Text(Authentication.instance.user.value!.email.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(onPressed: () { Authentication.instance.signout() ;},child: Container(alignment: Alignment.center,height: 20,width: 50,child: Text("Logout"),),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

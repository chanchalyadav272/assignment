import 'package:assignment/src/utils/authentication.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user = Authentication.instance.user;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
    preferredSize: Size.fromHeight(56), child: Appbar()),



      floatingActionButton: ElevatedButton(onPressed: () { Authentication.instance.signout() ;},child: Container(alignment: Alignment.center,height: 20,width: 50,child: Text("Logout"),),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

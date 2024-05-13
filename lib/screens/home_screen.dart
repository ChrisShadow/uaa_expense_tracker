import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isLogoutLoading=false;
  logOut() async{
    setState(() {
      isLogoutLoading=true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement( MaterialPageRoute(builder:
        (context)=>const LoginView()),);
    setState(() {
      isLogoutLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Hola, ", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon: isLogoutLoading
              ?const CircularProgressIndicator() :
          const Icon(Icons.exit_to_app,
          color: Colors.white,))
        ],
      ),
      body: Container(
          width: double.infinity,
          color: Colors.blue.shade900,
          child: const Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance total",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600
                  ) ),
                  Text("Gs. ",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          height: 1.2,
                          fontWeight: FontWeight.w600
                      ) )
                ],
              ),
            ],
          )),
    );
  }
}

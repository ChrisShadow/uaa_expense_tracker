
import 'package:expense_tracker/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';

class AuthService{
  var db=Db();
  createUser(data, context) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data['email'],
          password: data['password']);
      await db.addUser(data, context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
          (context)=>const Dashboard()),);
    }catch(e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Algo salió mal. Reintentar Signup."),
          content: Text(e.toString()),
        );
      });
    }

  }

  login(data, context) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'],
          password: data['password']);
      Navigator.of(context).pushReplacement( MaterialPageRoute(builder:
          (context)=>const Dashboard()),);
    }catch(e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Algo salió mal. Reintentar Login."),
          content: Text(e.toString()),
        );
      });
    }

  }



}
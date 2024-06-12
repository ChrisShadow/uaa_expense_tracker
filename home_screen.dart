/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/widget/add_transact_form.dart';
import 'package:expense_tracker/widget/hero_card.dart';
import 'package:expense_tracker/widget/transact_cards.dart';
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
  final userId= FirebaseAuth.instance.currentUser!.uid;
  _dialogBuilder(BuildContext context){
    return showDialog(context: context, builder: (context){
      return const AlertDialog(
        content: AddTransactForm(),
      );
    });
  }
  late Future<dynamic> userData;

  Future<Object?> fetchUserData() async {
    final DocumentSnapshot userDoc =
    await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.data();
    } else {
      throw Exception("Usuario no encontrado.");
    }
  }
  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: ((){
          _dialogBuilder(context);
        }),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: FutureBuilder<dynamic>(
          future: userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Cargando...', style: TextStyle(color: Colors.white));
            } else if (snapshot.hasError) {
              return const Text('Error', style: TextStyle(color: Colors.white));
            } else {
              return Text('Hola, ${snapshot.data['username']}', style: const TextStyle(color: Colors.white));
            }
          },
        ),
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon: isLogoutLoading
              ?const CircularProgressIndicator() :
          const Icon(Icons.exit_to_app,
          color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroCard(userId: userId,),
            const TransactCard()
          ],
        ),
      ),

    );
  }
}


 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/screens/info_screen.dart';
import 'package:expense_tracker/widget/add_transact_form.dart';
import 'package:expense_tracker/widget/hero_card.dart';
import 'package:expense_tracker/widget/transact_cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isLogoutLoading = false;

  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
    setState(() {
      isLogoutLoading = false;
    });
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;

  _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: AddTransactForm(),
        );
      },
    );
  }

  late Future<dynamic> userData;

  Future<Object?> fetchUserData() async {
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.data();
    } else {
      throw Exception("Usuario no encontrado.");
    }
  }

  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          _dialogBuilder(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: FutureBuilder<dynamic>(
          future: userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Cargando...', style: TextStyle(color: Colors.white));
            } else if (snapshot.hasError) {
              return const Text('Error', style: TextStyle(color: Colors.white));
            } else {
              return Text('Hola, ${snapshot.data['username']}', style: const TextStyle(color: Colors.white));
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              );
            },
          ),
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: isLogoutLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.exit_to_app, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroCard(userId: userId),
            const TransactCard(),
          ],
        ),
      ),
    );
  }
}

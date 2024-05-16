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
      body: const Column(
        children: [
          HeroCard(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text("Transacciones recientes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
              ],
            ),
          )
        ],
      ),

    );
  }
}

class HeroCard extends StatelessWidget{
  const HeroCard({
    super.key,
  });
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.blue.shade900,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Balance total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w600
                    ) ),
                Text("Gs.2.000.000 ",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      height: 1.2,
                      fontWeight: FontWeight.w600
                  ), ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top:30,bottom: 10, left: 10, right: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                CardOne(color: Colors.green,),
                SizedBox(
                  width: 10,
                ),
                CardOne(color: Colors.red,),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class CardOne extends StatelessWidget{
  const CardOne({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Crédito",
                style: TextStyle(
                    fontSize: 14,
                    color: color),),
                Text("Gs.1.000.000",
                  style: TextStyle(
                      color: color,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),)],),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Icon(
                  Icons.arrow_upward_outlined,
                  color: color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

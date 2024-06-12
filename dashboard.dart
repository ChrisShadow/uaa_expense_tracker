
import 'package:expense_tracker/screens/trans_screen.dart';
import 'package:expense_tracker/widget/navbar.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class  Dashboard extends StatefulWidget {
  const Dashboard ({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading=false;
  int currentIndex=0;
  var pageViewList=[const Home(),const Transaction()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value){
          setState(() {
            currentIndex=value;
          });
        },
      ),

      body: pageViewList[currentIndex],
    );
  }
}

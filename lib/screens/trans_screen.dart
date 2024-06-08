import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/category_list.dart';
import '../widget/tab_var_view.dart';
import '../widget/time_line.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  var category="Todos";
  var monthYear="";
  @override
  void initState(){
    super.initState();
    DateTime now=DateTime.now();
    setState(() {
      monthYear=DateFormat('MMM y').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansivo"),

      ),
      body: Column(
          children: [
            TimeLineMonth(onChanged: (
                String? value) {
              if(value != null){
                setState(() {
                  monthYear = value;
                });
              }
            },),
            CategoryList(onChanged: (
                String? value) {
              if(value != null){
                setState(() {
                  category = value;
                });
              }
            },),
            TypeTabVar(category: category, monthYear: monthYear,),
          ],
        ),
    );
  }
}

import 'package:expense_tracker/widget/transaction_list.dart';
import 'package:flutter/material.dart';

class TypeTabVar extends StatelessWidget {
  const TypeTabVar({super.key, required this.category, required this.monthYear});
  final String category;
  final String monthYear;


  @override
  Widget build(BuildContext context) {
    return Expanded(child: DefaultTabController(
      length: 2,
        child: Column(
          children:   [
            const TabBar(tabs: [
            Tab(text: "Crédito",),
            Tab(text: "Débito",),
            ]),
            Expanded(child: TabBarView(children: [
              TransactionList(category: category,monthYear: monthYear, type: 'crédito' ,),
              TransactionList(category: category,monthYear: monthYear , type: 'débito',),
            ],))
          ]),
    ));
  }
}

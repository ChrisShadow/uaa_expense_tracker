import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/icon_lists.dart';

class TransactionCard extends StatelessWidget{
  TransactionCard({
    super.key, required this.data,
  });
  final dynamic data;
  final appIcons=AppIcons();
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0,10),
                  color: Colors.grey.withOpacity(0.09),
                  spreadRadius: 4.0)
            ]
        ),
        child: ListTile(
          minVerticalPadding: 5,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 0
          ),
          leading: SizedBox(
            width: 70,
            height: 100,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green.withOpacity(0.2),
              ),
              child: Center(
                child: FaIcon(
                    appIcons.getExpenseCategoryIcons('${data['category']}')
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              const Expanded(child: Text("Taller auto Feb 2024", style:
              TextStyle(fontSize: 15),)),
              Text("Gs. ${data['amount']}", style: const TextStyle(
                  color: Colors.green, fontSize: 15),)
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Balance", style: TextStyle(
                      color: Colors.grey, fontSize: 13),),
                  const Spacer(),
                  Text("Gs. ${data['remainingAmount']}", style: const TextStyle(
                      color: Colors.grey, fontSize: 13),)
                ],),
              const Text("29 feb 16:57", style: TextStyle(
                  color: Colors.grey
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../utils/icon_lists.dart';

class TransactionCard extends StatelessWidget{
  TransactionCard({
    super.key, required this.data,
  });
  final dynamic data;
  final appIcons=AppIcons();
  @override
  Widget build(BuildContext context){
    DateTime date=DateTime.fromMillisecondsSinceEpoch(data['timestamp']);
    String formattedDate=DateFormat('d MMM hh:mma').format(date);
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
                color:data['type']== 'crédito' ?
                Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2)
              ),
              child: Center(
                child: FaIcon(
                    appIcons.getExpenseCategoryIcons('${data['category']}'),
                    color:data['type']== 'crédito' ?
                    Colors.green : Colors.red
                ),
              ),
            ),
          ),
          title: Row(
            children: [
               Expanded(child: Text('${data['title']}', style:
              const TextStyle(fontSize: 18),)),
              Text("${data['type']=='crédito' ? '+':'-'}Gs.${data['amount']}", style: TextStyle(
                  color: data['type']== 'crédito' ?
                  Colors.green : Colors.red, fontSize: 18),)
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Balance", style: TextStyle(
                      color: Colors.grey, fontSize: 15),),
                  const Spacer(),
                  Text("Gs. ${data['remainingAmount']}", style: const TextStyle(
                      color: Colors.grey, fontSize: 15),)
                ],),
              Text(formattedDate , style: const TextStyle(
                  color: Colors.grey
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
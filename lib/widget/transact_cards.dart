
import 'package:expense_tracker/utils/icon_lists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactCard extends StatelessWidget {
  TransactCard({super.key});

  final appIcons=AppIcons();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Row(
            children: [
              Text("Transacciones recientes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
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
                          appIcons.getExpenseCategoryIcons('home')
                        ),
                      ),
                    ),
                  ),
                  title: const Row(
                    children: [
                      Expanded(child: Text("Taller auto Feb 2024", style:
                        TextStyle(fontSize: 15),)),
                      Text("Gs. 500.000", style: TextStyle(
                        color: Colors.green, fontSize: 15),)
                    ],
                  ),
                  subtitle: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Balance", style: TextStyle(
                              color: Colors.grey, fontSize: 13),),
                          Spacer(),
                          Text("Gs. 50.000", style: TextStyle(
                            color: Colors.grey, fontSize: 13),)
                        ],),
                      Text("29 feb 16:57", style: TextStyle(
                        color: Colors.grey
                      ),)
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

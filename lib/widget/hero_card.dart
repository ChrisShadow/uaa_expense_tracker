import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatNumber(dynamic number) {
  final formatter = NumberFormat("#,##0", "de_DE"); // Use German locale for dot as thousand separator
  if (number == null) {
    return "0";
  } else if (number is int) {
    return formatter.format(number);
  } else if (number is String) {
    return formatter.format(int.parse(number));
  } else if (number is double) {
    return formatter.format(number.toInt());
  }
  return number.toString(); // Fallback in case of unexpected type
}

class HeroCard extends StatelessWidget{
  const HeroCard({
    super.key, required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context){
    final Stream <DocumentSnapshot> userStream = FirebaseFirestore.instance.collection('users').doc(userId).snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userStream,
        builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot> snapshot){
          if (snapshot.hasError){
            return const Text('Algo no salió bien.');
          }
          if (!snapshot.hasData || !snapshot.data!.exists){
            return const Text('El documento no existe.');
          }

          if(snapshot.connectionState==ConnectionState.waiting){
            return const Text('Cargando, favor aguarde.');
          }

          var data=snapshot.data!.data() as Map<String, dynamic>;

          return Cards(data: data,);
    });
  }
}
class Cards extends StatelessWidget{
  const Cards({
    super.key, required this.data,
  });

  final Map data;
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.blue.shade900,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Balance total",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.2,
                            fontWeight: FontWeight.w600
                        ) ),
                    Text("Gs.${formatNumber(data['remainingAmount'])}",
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          height: 1.2,
                          fontWeight: FontWeight.w600
                      ), ),
                  ],
                ),
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
              child: Row(
                children: [
                  CardOne(color: Colors.green, heading: 'Crédito', amount: formatNumber(data['totalCredit']),),
                  const SizedBox(
                    width: 10,
                  ),
                  CardOne(color: Colors.red, heading: 'Débito', amount: formatNumber(data['totalDebit']),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}


class CardOne extends StatelessWidget{
  const CardOne({
    super.key, required this.color, required this.heading, required this.amount,
  });
  final Color color;
  final String heading;
  final String amount;
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
                children: [Text(heading,
                  style: TextStyle(
                      fontSize: 14,
                      color: color),),
                  Text("Gs$amount",
                    style: TextStyle(
                        color: color,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),)],),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Icon(
                  heading=="Crédito"?
                  Icons.arrow_upward_outlined:Icons.arrow_downward_outlined,
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

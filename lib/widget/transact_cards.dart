
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/widget/transaction_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactCard extends StatelessWidget {
  const TransactCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Text("Transacciones recientes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
              ],
            ),
            RecentTransactionsList()
          ],
        ),
      ),
    );
  }
}

class RecentTransactionsList extends StatelessWidget {
  RecentTransactionsList({
    super.key,
  });
  final userId=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("transactions")
        .orderBy('timestamp',descending: true).limit(20)
        .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return const Text("Algo no salió bien.");
        }
        else if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Cargando,favor aguarde.");
        }
        else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
          return const Center(child: Text("Transacciones no encontradas."),);
        }
        var data=snapshot.data!.docs;
        return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              var cardData=data[index];
              return TransactionCard(data: cardData,);
            });
  });
  }
}



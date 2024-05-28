import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/utils/appvalidator.dart';
import 'package:expense_tracker/widget/category_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddTransactForm extends StatefulWidget {
  const AddTransactForm({super.key});

  @override
  State<AddTransactForm> createState() => _AddTransactFormState();
}

class _AddTransactFormState extends State<AddTransactForm> {
  var type="crédito";
  var category="Otros";
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  var isLoader=false;
  var appValidator=AppValidator();
  var amountEditController=TextEditingController();
  var titleEditController=TextEditingController();
  var uid=const Uuid();
  Future <void> _submitForm() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader=true;
      });
      final user=FirebaseAuth.instance.currentUser;
      int timestamp=DateTime.now().microsecondsSinceEpoch;
      var amount=int.parse(amountEditController.text);
      DateTime date=DateTime.now();
      var id=uid.v4();
      String monthYear=DateFormat('MMM y').format(date);
      final userDoc=await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      int remainingAmount=userDoc['remainingAmount'];
      int totalCredit=userDoc['totalCredit'];
      int totalDebit=userDoc['totalDebit'];

      if(type=='crédito'){
        remainingAmount+=amount;
        totalCredit+=amount;
      }else{
        remainingAmount-=amount;
        totalDebit+=amount;
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
            "remainingAmount":remainingAmount,
            "totalCredit":totalCredit,
            "totalDebit":totalDebit,
            "updatedAt":timestamp,
      });
      var data={
        "id":id,
        "title":titleEditController.text,
        "amount":amount,
        "type":type,
        "timestamp":timestamp,
        "totalCredit":totalCredit,
        "totalDebit":totalDebit,
        "remainingAmount":remainingAmount,
        "monthYear":monthYear,
        "category":category,
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid).collection("transactions").doc(id).set(data);
      //await authService.login(data, context);
      Navigator.pop(context);

      setState(() {
        isLoader=false;
      });

      //ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
      //const SnackBar(content: Text("Cuenta iniciada con éxito")),
      //);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleEditController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: appValidator.isEmptyCheck,
                decoration: const InputDecoration(
                  labelText: 'Título'
                ),),
              TextFormField(
                controller: amountEditController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: appValidator.isEmptyCheck,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Monto"
                ),),
              CategoryDropDown(
                cattype: category,
                onChanged: (String? value){
                  if(value != null){
                    setState(() {
                      category=value;
                    });
                  }
                },
              ),
              DropdownButtonFormField(
                  value: 'crédito',
                  items: const [
                    DropdownMenuItem(value: 'crédito',child: Text('Crédito'),),
                    DropdownMenuItem(value: 'débito',child: Text('Débito'),)],
                  onChanged: (value){
                    if(value !=null){
                      setState(() {
                        type=value;
                      });
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: (){
                    if(isLoader==false) {
                      _submitForm();
                    }
                  },
                  child:
                  isLoader ? const Center(child: CircularProgressIndicator()):
                  const Text("Añadir transacción"))
            ],
          ),
        ),
      ),
    );
  }
}

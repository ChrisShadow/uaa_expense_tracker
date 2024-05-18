import 'package:expense_tracker/widget/category_dropdown.dart';
import 'package:flutter/material.dart';

class AddTransactForm extends StatefulWidget {
  const AddTransactForm({super.key});

  @override
  State<AddTransactForm> createState() => _AddTransactFormState();
}

class _AddTransactFormState extends State<AddTransactForm> {
  var type="crédito";
  var category="Otros";
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Título'
            ),),
          TextFormField(
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
              })
        ],
      ),
    );
  }
}

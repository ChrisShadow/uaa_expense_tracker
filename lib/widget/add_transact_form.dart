import 'package:expense_tracker/utils/appvalidator.dart';
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
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  var isLoader=false;
  var appValidator=AppValidator();
  Future <void> _submitForm() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader=true;
      });


      //var data={
        //"email":_userEmailController.text,
        //"password":_userPassController.text
      //};
      //await authService.login(data, context);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appValidator.isEmptyCheck,
              decoration: const InputDecoration(
                labelText: 'Título'
              ),),
            TextFormField(
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
    );
  }
}

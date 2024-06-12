import 'package:expense_tracker/screens/sign_up.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../utils/appvalidator.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  final _userEmailController=TextEditingController();
  final _userPassController=TextEditingController();
  final authService=AuthService();
  var isLoader=false;

  Future <void> _submitForm() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader=true;
      });
      var data={
        "email":_userEmailController.text,
        "password":_userPassController.text
      };
      await authService.login(data, context);

      setState(() {
        isLoader=false;
      });

      //ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        //const SnackBar(content: Text("Cuenta iniciada con éxito")),
      //);
    }
  }

  final appValidator=AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF252634),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height:40.0,
                  ),
                  const SizedBox(
                    height: 100.0,
                    child: Image(image: AssetImage('assets/icons/uaalogo.png')),
                  ),
                  const SizedBox(
                    height:20.0,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text(
                      "Iniciar sesión",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(
                    height:16.0,
                  ),
                  TextFormField(
                    controller: _userEmailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: _buildInputDecoration("Correo electrónico",Icons.email),
                      validator: appValidator.validateEmail),
                  const SizedBox(
                    height:16.0,
                  ),
                  TextFormField(
                    controller: _userPassController,
                      style: const TextStyle(color: Colors.white),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: _buildInputDecoration("Contraseña",Icons.lock),
                      validator: appValidator.validatePass),
                  const SizedBox(
                    height:40.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor:
                        const Color.fromARGB(255,241,89,0)),
                        onPressed: () {isLoader ? print("Cargando...") :
                        _submitForm();
                        },
                        child: isLoader
                            ? const Center(child: CircularProgressIndicator())
                            :
                        const Text(
                            "Login", style: TextStyle(fontSize: 20))),
                  ),
                  const SizedBox(
                    height:20.0,
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>const SignUpView()),);
                  },
                      child: const Text("Crear cuenta",style: TextStyle(
                          color: Color(0xFFF15900),fontSize: 20),
                      )
                  )
                ],
              ),
            ),),)) ;
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon){
    return InputDecoration(
        fillColor: const Color(0xAA494A59),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: const TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(suffixIcon,color: const Color(0xFF949494),),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0))
    );
  }
}

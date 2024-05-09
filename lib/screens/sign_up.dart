
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/services/auth_service.dart';
import 'package:expense_tracker/utils/appvalidator.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  final _userNameController=TextEditingController();

  final _userEmailController=TextEditingController();

  final _userPhoneController=TextEditingController();

  final _userPassController=TextEditingController();

  final authService=AuthService();

  var isLoader=false;

  Future <void> _submitForm() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader=true;
      });
      var data={
        "username":_userNameController.text,
        "email":_userEmailController.text,
        "password":_userPassController.text,
        "phone":_userPhoneController.text
      };
      await authService.createUser(data, context);
      setState(() {
        isLoader=false;
      });
      //ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        //const SnackBar(content: Text("Resgistro realizado con éxito")),
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
          child: Column(
            children: [
              const SizedBox(
                height:80.0,
              ),
              const SizedBox(
                width: 250,
                child: Text(
                  "Crearme una cuenta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(
                height:50.0,
              ),
              TextFormField(
                controller: _userNameController,
                style: const TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Nombre de usuario",Icons.person),
                validator:appValidator.validateUser),
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
                controller: _userPhoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Nro. de teléfono",Icons.call),
                validator: appValidator.validatePhoneNumber),
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
                  onPressed: (){isLoader ? print("Cargando..."):
                  _submitForm();
                  },
                  child: isLoader
                      ? const Center(child: CircularProgressIndicator())
                  : const Text(
                    "Crear", style: TextStyle(fontSize: 20))),
              ),
              const SizedBox(
                height:20.0,
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:
                (context)=>LoginView()),);
              },
                  child: const Text("Login",style: TextStyle(
                      color: Color(0xFFF15900),fontSize: 20),
                  )
              )
            ],
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

class AppValidator{
  String? validateEmail(value){
    if(value!.isEmpty){
      return 'Dato requerido';
    }
    RegExp emailRegExp=RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Formato del correo inválido.';
    }
    return null;
  }
  String? validatePhoneNumber(value){
    if(value!.isEmpty){
      return 'Dato requerido';
    }
    if(value.length >14){
      return 'Cantidad de dígitos no corresponde';
    }
    return null;
  }
  String? validateUser(value){
    if(value!.isEmpty){
      return 'Dato requerido';
    }
    return null;
  }
  String? validatePass(value){
    if(value!.isEmpty){
      return 'Dato requerido';
    }
    return null;
  }
}
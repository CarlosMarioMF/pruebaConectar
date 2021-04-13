import 'dart:async';

class Validators{

  final validarNombre = StreamTransformer<String, String>.fromHandlers(
    handleData: (nombre, sink){
      if(nombre.length >= 2){
        sink.add(nombre);
      }else{
        sink.addError('Debe tener más de 2 caracteres');
      }
    }
  );
  
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Email no es correcto');
      }
    }
  );

  final validarID = StreamTransformer<String, String>.fromHandlers(
    handleData: (id, sink){
      if(id.length >= 8){
        sink.add(id);
      }else{
        sink.addError('Debe tener más de 8 caracteres');
      }
    }
  );

  final validarCelular = StreamTransformer<String, String>.fromHandlers(
    handleData: (celular, sink){
      if(celular.length >= 10){
        sink.add(celular);
      }else{
        sink.addError('Debe tener más de 10 caracteres');
      }
    }
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 8){
        sink.add(password);
      }else{
        sink.addError('Debe tener más de 8 caracteres');
      }
    }
  );

}
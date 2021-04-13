import 'dart:async';

import 'package:prueba_conectarse/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  final _nombreController   = BehaviorSubject<String>();
  final _emailController    = BehaviorSubject<String>();
  final _idController       = BehaviorSubject<String>();
  final _celularController  = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get nombreStream   => _nombreController.stream.transform(validarNombre);
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get idStream       => _idController.stream.transform(validarID);
  Stream<String> get celularStream  => _celularController.stream.transform(validarCelular);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get validFormStream =>
    Observable.combineLatest5(nombreStream, emailStream, idStream, celularStream, passwordStream, (n, e, i, c, p) => true);

  //Insertar valores al String
  Function(String) get changeNombre   => _nombreController.sink.add;
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changeID       => _idController.sink.add;
  Function(String) get changeCelular  => _celularController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener el ultimo valor ingresado a los streams
  String get nombre   => _nombreController.value;
  String get email    => _emailController.value;
  String get id       => _idController.value;
  String get celular  => _celularController.value;
  String get password => _passwordController.value;

  dispose(){
    _nombreController?.close();
    _emailController?.close();
    _idController?.close();
    _celularController?.close();
    _passwordController?.close();
  }

}






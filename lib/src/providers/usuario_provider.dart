
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_conectarse/src/preferences_usuario/preferencias_usuario.dart';

class UsuarioProvider{

  final String _firebaseToken ='AIzaSyBePiQMYicddwKt1yierbD_KCGHa3apwL8';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password)  async{
    
    final authData ={
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    //final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=$_firebaseToken');

    final resp = await http.post(
      Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'), 
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if(decodedResp.containsKey('idToken')){
      // TODO: Salvar el token en el storage
      _prefs.token = decodedResp['idToken'];
       return {'ok': true, 'token': decodedResp['idToken']};
    }else{
       return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }

  }
  
  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async{  
    
    final authData ={
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    //final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=$_firebaseToken');

    final resp = await http.post(
      Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken'), 
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if(decodedResp.containsKey('idToken')){

      _prefs.token = decodedResp['idToken'];
      // TODO: Salvar el token en el storage
       return {'ok': true, 'token': decodedResp['idToken']};
    }else{
       return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }


  }
}
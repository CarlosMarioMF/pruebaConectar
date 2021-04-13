
import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider{

  Future nuevoUsuario(String email, String password) async{

    final String _firebaseToken ='AIzaSyBePiQMYicddwKt1yierbD_KCGHa3apwL8';
    
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

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
      // TODO: Salvar el token en el storage
       return {'ok': true, 'token': decodeResp['idToken']};
    }else{
       return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }


  }
}
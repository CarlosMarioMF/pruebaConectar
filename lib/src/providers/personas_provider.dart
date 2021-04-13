//es el encargado de realizar las interacciones directas con la BD
//
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_conectarse/src/models/persona_model.dart';

class PersonasProvider{

  final String _url = 'https://conectarbd-default-rtdb.firebaseio.com';

  Future<bool> crearPersona(PersonasModel persona) async{
    
    final url = Uri.parse('$_url/personas.json');

    final resp = await http.post(url, body: personasModelToJson(persona));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }


}
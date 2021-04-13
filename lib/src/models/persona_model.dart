// To parse this JSON data, do
//
//     final personasModel = personasModelFromJson(jsonString);

import 'dart:convert';

PersonasModel personasModelFromJson(String str) => PersonasModel.fromJson(json.decode(str));

String personasModelToJson(PersonasModel data) => json.encode(data.toJson());

class PersonasModel {
    PersonasModel({
        this.nombre ='',
        this.email ='',
        this.id ='',
        this.celular= '',
        this.password= '',
    });

    String nombre;
    String email;
    String id;
    String celular;
    String password;

    factory PersonasModel.fromJson(Map<String, dynamic> json) => PersonasModel(
        nombre:   json["nombre"],
        email:    json["email"],
        id:       json["id"],
        celular:  json["celular"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "nombre"  : nombre,
        "email"   : email,
        "id"      : id,
        "celular" : celular,
        "password": password,
    };
}

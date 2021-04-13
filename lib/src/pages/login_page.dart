import 'package:flutter/material.dart';
import 'package:prueba_conectarse/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('login Page'),
      ),
      body: Stack(
        children: <Widget>[
          Divider(),
          Text('Registro Exitoso '),
          Divider(),
          Text('Nombre: ${bloc.nombre}'),
          Divider(),
          Text('Email: ${bloc.email}'),
          //_crearFondo(context),
          //_loginForm(context),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:prueba_conectarse/src/models/persona_model.dart';
import 'package:prueba_conectarse/src/providers/personas_provider.dart';


class Register2Page extends StatefulWidget {

  @override
  _Register2PageState createState() => _Register2PageState();
}

class _Register2PageState extends State<Register2Page> {
  final formKey = GlobalKey<FormState>();
  final personasProvider = new PersonasProvider();

  PersonasModel persona = new PersonasModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual), 
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt), 
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearEmail(),
                _crearID(),
                _crearCelular(),
                _crearPassword(),
                _crearBoton(),
              ],
            ),
          ),
        ),
        
      ),
      
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: persona.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
      onSaved: (value) => persona.nombre = value,
      validator: (value){
        if(value.length < 3){
          return 'Ingrese su nombre ';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: persona.email,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      onSaved: (value) => persona.email = value,
      validator: (value){
        if(value.length < 4){
          return 'Ingrese su E-mail ';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearID() {
    return TextFormField(
      initialValue: persona.id,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Identificación',
      ),
      onSaved: (value) => persona.id = value,
      validator: (value){
        if(value.length < 9){
          return 'Ingrese su identificación';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearCelular() {
    return TextFormField(
      initialValue: persona.celular,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Número de celular',
      ),
      onSaved: (value) => persona.celular = value,
      validator: (value){
        if(value.length < 10){
          return 'Ingrese su numero de celular ';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearPassword() {
    return TextFormField(
      obscureText: true,
      initialValue: persona.password,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      onSaved: (value) => persona.password = value,
      validator: (value){
        if(value.length < 9){
          return 'Ingrese su contraseña';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {

    return RaisedButton.icon (
      label: Text('Registrarse'),
      icon: Icon(Icons.save_alt),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: _submit,
    );

  }

  void _submit(){
    
    if( !formKey.currentState.validate()  ) return;

    formKey.currentState.save();

    personasProvider.crearPersona(persona);

    print(persona.nombre);
    print(persona.email);
    print(persona.id);
    print(persona.celular);
    print(persona.password);
  }

}
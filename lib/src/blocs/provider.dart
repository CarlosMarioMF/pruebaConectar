import 'package:flutter/material.dart';
import 'package:prueba_conectarse/src/blocs/login_bloc.dart';
export 'package:prueba_conectarse/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget{
  
  static Provider _instancia;

  factory Provider({Key key, Widget child}){
    if(_instancia == null){
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}): super(key: key, child: child);

  //con patron singleton
  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

}
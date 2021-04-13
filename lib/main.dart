import 'package:flutter/material.dart';

import 'package:prueba_conectarse/src/blocs/provider.dart';
import 'package:prueba_conectarse/src/pages/register2_page.dart';

import 'package:prueba_conectarse/src/pages/home_page.dart';
import 'package:prueba_conectarse/src/pages/login_page.dart';
import 'package:prueba_conectarse/src/pages/register_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login'   : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'register2': (BuildContext context) => Register2Page(),
          'home'    : (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primaryColor:  Colors.deepPurple,
        ),
      )
    );
    
  }
}
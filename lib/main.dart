import 'package:beats/src/pages/home_pages.dart';
import 'package:beats/src/services/producto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => ProductosProvider())
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beats App',
        initialRoute: 'home',
        routes:{
          'home':(BuildContext context) => HomePage(),
        }
      ),
    );
  }
}
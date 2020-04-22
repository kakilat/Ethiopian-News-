import 'package:ethionews/Home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Um',
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Color(0xffff09b)
      ),
      home:Home(),
    );
  }
}

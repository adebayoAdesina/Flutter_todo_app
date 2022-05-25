import 'package:flutter/material.dart';
import 'package:flutter_todo_with_provider/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0XFF2F5233),
        appBarTheme: const AppBarTheme(color: Color(0XFF2F5233)),
        backgroundColor: const Color(0XFFDCDCDC)
      ),
      home: const Home(),
    );
  }
}

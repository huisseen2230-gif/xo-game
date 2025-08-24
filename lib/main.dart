import 'package:flutter/material.dart';
import 'package:xo/board_screen.dart';
import 'package:xo/home_screen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // hello world
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        HomeScreen.routeName : (context)=> HomeScreen(),
        BoardScreen.routeName : (context)=> BoardScreen()
      },
      initialRoute: HomeScreen.routeName ,
    );
  }
}


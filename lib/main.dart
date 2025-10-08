import 'package:flutter/material.dart';

import 'features/first_screen/first_screen.dart';
import 'features/second_screen/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/firstscreen': (context) =>  FirstScreen(),
        '/secondscreen': (context) =>  SecondScreen(),
      },

      //initialRoute: '/firstscreen',
      home: FirstScreen(),
    );
  }
}

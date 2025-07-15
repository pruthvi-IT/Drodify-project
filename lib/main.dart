//import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
//import 'package:drodify_project/04HomeScreen/4.8%20Search%20Result-empty.dart';
//import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';
import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
import 'package:drodify_project/04HomeScreen/4.11%20notification-empty.dart';
import 'package:drodify_project/04HomeScreen/4.2%20Search%20Location-default.dart';
import 'package:drodify_project/04HomeScreen/4.6%20search%20details.dart';
import 'package:drodify_project/04HomeScreen/4.8%20Search%20Result-empty.dart';
import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';
import 'package:drodify_project/Booking%20History/8.1%20Booking%20%20History-upcoming.dart';
//import 'package:drodify_project/Ai/10.1%20Ai-Default.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: EmptyNotification(),
    );
  }
}

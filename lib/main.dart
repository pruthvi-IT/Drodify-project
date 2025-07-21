//import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
//import 'package:drodify_project/04HomeScreen/4.8%20Search%20Result-empty.dart';
//import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';

import 'package:drodify_project/08%20Booking%20History/8.17%20Booking%20History-Completed.dart';
import 'package:drodify_project/08%20Booking%20History/8.18%20Booking%20History-Add%20Review-Default.dart';
import 'package:drodify_project/08%20Booking%20History/8.19%20Booking%20History%20-%20Add%20Review%20-%20Filled.dart';
import 'package:drodify_project/08%20Booking%20History/8.20%20Booking%20History-Canceled.dart';
import 'package:drodify_project/08%20Booking%20History/8.21%20Booking%20History-Empty.dart';

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
      home:  BookingHistoryEmpty(),
    );
  }
}

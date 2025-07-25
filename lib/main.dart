//import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
//import 'package:drodify_project/04HomeScreen/4.8%20Search%20Result-empty.dart';
//import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';

import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.1%20Hotel%20Details.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.2%20Hotel%20Details-Scrolling%201.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.3%20Hotel%20Details-Scrolling%202.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.7%20All%20Review.dart';
import 'package:drodify_project/05%20Home%20Detail%20Screen/5.9%20All%20Review-Open%20Picture.dart';
import 'package:drodify_project/08%20Booking%20History/8.1%20Booking%20%20History-upcoming.dart';
import 'package:drodify_project/10.5%20AI-Hotel%20Details.dart';
import 'package:drodify_project/6.17%20Payment-Promo%20Code%20Success.dart';
import 'package:drodify_project/7.9%20select%20Hotel%20to%20Delete.dart';
import 'package:flutter/material.dart';

import '08 Booking History/8.10 Booking History-Recent-Guest info.dart';
import '08 Booking History/8.4 Booking History Reschdule-default.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BookingHistory(),
    );
  }
}

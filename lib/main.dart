//import 'package:drodify_project/04HomeScreen/4.1%20Home.dart';
//import 'package:drodify_project/04HomeScreen/4.8%20Search%20Result-empty.dart';
//import 'package:drodify_project/04HomeScreen/4.9%20notification-default.dart';

import 'package:drodify_project/08%20Booking%20History/8.1%20Booking%20%20History-upcoming.dart';
import 'package:drodify_project/08%20Booking%20History/8.11%20Booking%20History-Reschdule-Info%20Changed.dart';
import 'package:drodify_project/08%20Booking%20History/8.12%20Booking-History-Reschdule-Conformation.dart';
import 'package:drodify_project/08%20Booking%20History/8.13%20Booking%20History-Reschdule-Payment.dart';
import 'package:drodify_project/08%20Booking%20History/8.14%20Booking%20History-Reschudule%20Succeed.dart';
import 'package:drodify_project/08%20Booking%20History/8.15%20Booking%20History-Reschdule-Failed.dart';
import 'package:drodify_project/08%20Booking%20History/8.16%20Booking%20History-E-Receipt.dart';
import 'package:drodify_project/08%20Booking%20History/8.17%20Booking%20History-Completed.dart';
import 'package:drodify_project/08%20Booking%20History/8.18%20Booking%20History-Add%20Review-Default.dart';
import 'package:drodify_project/08%20Booking%20History/8.19%20Booking%20History%20-%20Add%20Review%20-%20Filled.dart';
import 'package:drodify_project/08%20Booking%20History/8.2%20Booking%20History-Cancellation.dart';
import 'package:drodify_project/08%20Booking%20History/8.20%20Booking%20History-Canceled.dart';
import 'package:drodify_project/08%20Booking%20History/8.21%20Booking%20History-Empty.dart';
import 'package:drodify_project/08%20Booking%20History/8.9%20Booking%20History-Reschdule-filled.dart';

//import 'package:drodify_project/Ai/10.1%20Ai-Default.dart';
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
      home:  BookingHistory(),
    );
  }
}

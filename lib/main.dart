import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:panir_hisab/firebase_messeging.dart';
import 'package:panir_hisab/mainscree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMesseging().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'resto_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Resto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestoProfile(),
    );
  }
}

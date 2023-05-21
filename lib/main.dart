import 'package:flutter/material.dart';
import 'package:tugas_akhir/Authentication/login.dart';
import 'package:tugas_akhir/MoneyConv/convertion.dart';
import 'package:tugas_akhir/DateConv/convertion.dart';
import 'package:tugas_akhir/Music/music.dart';
import 'package:tugas_akhir/home.dart';
import 'package:tugas_akhir/profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas  Akhir',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/Authentication/login.dart';
import 'package:tugas_akhir/MoneyConv/convertion.dart';
import 'package:tugas_akhir/DateConv/convertion.dart';
import 'package:tugas_akhir/Music/music.dart';
import 'package:tugas_akhir/home.dart';
import 'package:tugas_akhir/profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future getAccessToken() async {
    SharedPreferences pref = await _prefs;
    String? accessToken = pref.getString("accessToken");
    return accessToken;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas  Akhir',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
          future: getAccessToken(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return Home();
            } else {
              return Login();
            }
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}

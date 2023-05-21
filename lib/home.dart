import 'package:flutter/material.dart';
import 'package:tugas_akhir/Authentication/Models/UserModel.dart';
import 'package:tugas_akhir/Authentication/logout.dart';
import 'package:tugas_akhir/MoneyConv/convertion.dart';
import 'package:tugas_akhir/DateConv/convertion.dart';
import 'package:tugas_akhir/Music/music.dart';
import 'package:tugas_akhir/profil.dart';
import 'package:tugas_akhir/kesanpesan.dart';

class Home extends StatefulWidget {
  final Model model;

  const Home({super.key, required this.model});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedOptions = 0;
  int _previousSelection = 0;

  List<Widget> menu = [
    Profil(),
    KesanPesan(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Akhir TPM"),
      ),
      body: menu[_selectedOptions],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kesan Pesan'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        onTap: (index) {
          setState(() {
            _previousSelection = _selectedOptions;
            _selectedOptions = index;

            if (_selectedOptions == 2) {
              _selectedOptions = _previousSelection;

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Logout(
                            accessToken: widget.model.data.accessToken,
                          )));
            }
          });
        },
        selectedItemColor: Colors.blue,
        currentIndex: _selectedOptions,
        unselectedItemColor: Colors.grey,
      ),
      drawer: _buildDrawer(),
    );
  }

  //widget ini adalah isi dari sidebar atau drawer
  Widget _buildDrawer() {
    return SizedBox(
      //membuat menu drawer
      child: Drawer(
        //membuat list,
        //list digunakan untuk melakukan scrolling jika datanya terlalu panjang
        child: ListView(
          padding: EdgeInsets.zero,
          //di dalam listview ini terdapat beberapa widget drawable
          children: [
            UserAccountsDrawerHeader(
              //membuat nama akun
              accountName: (widget.model.data.user.name == "")
                  ? Text("Undefined")
                  : Text(widget.model.data.user.name),
              //membuat nama email
              accountEmail: Text(widget.model.data.user.email),
              //memberikan background
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/04/24/20/52/laundry-1350593_960_720.jpg"),
                      fit: BoxFit.cover)),
            ),
            //membuat list menu
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text("API Lirik"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MusicLyrics()));
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on_outlined),
              title: Text("Konversi Uang"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MoneyConv()));
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text("Konversi Waktu"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DateConv()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

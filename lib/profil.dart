import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 6,
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/profile.JPG'),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 16,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            width: MediaQuery.of(context).size.width * 3 / 4,
            child: Card(
              child: Column(children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: const [
                              Text(
                                'Nama :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              Text(
                                'Muhammad Rizki Firmansyah',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: const [
                              Text(
                                'NIM :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              Text(
                                '123200064',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: const [
                              Text(
                                'Kelas :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              Text(
                                'Teknologi Pemrograman Mobile IF-E',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: const [
                              Text(
                                'Hobi :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              Text(
                                'Musik dan Game',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class KesanPesan extends StatelessWidget {
  const KesanPesan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kesan Pesan",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 10),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Selama mengikuti perkuliahan Teknologi Pemrograman Mobile, saya menikmati materi-materi yang diajarkan. Adapun beberapa materi masih mengganjal di otak saya namun akan saya coba pelajari lagi. Untuk keseluruhan, perkuliahan ini sangat menyenangkan dan mengasah keterampilan coding saya. Terima Kasih.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(overflow: TextOverflow.clip),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Notes: kalo bisa kasih tugasnya yang lebih ramah mahasiswa pak",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

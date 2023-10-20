import 'package:flutter/material.dart';
import 'lvbuilder.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise & Nutrition'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari makanan...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 20),
                  // color: Colors.black,
                  child: Text(
                    'TANTANGAN 7X4',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 340,
                width: double.infinity,
                // margin: EdgeInsets.only(top: 5),
                // color: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    IsiList(
                      gambar: "assets/image/posing.png",
                      teks: "SELURUH TUBUH TANTANGAN",
                      desc:
                          "Mulailah perjalanan membentuk tubuh dengan fokus pada semua kelompok oto dan bangun tubuh impianmu dalam 4 minggu!",
                      warna: Colors.blue,
                    ),
                    IsiList(
                      gambar: "assets/image/legpose.png",
                      teks: "TUBUH BAGIAN BAWAH",
                      desc:
                          "Hanya dalam 4 minggu, kuatkan kaki, tingkatkn kekuatan tubuh bagian bawah, dan tingkatkan kebugaran secara keseluruhan!",
                      warna: Colors.blueAccent.shade700,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 20),
                  // color: Colors.black,
                  child: Text(
                    'Macronutrient',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 400,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        macro(
                          makanan: 'https://media.istockphoto.com/id/1143492200/photo/boiled-egg-and-half-isolated-on-white-background.jpg?b=1&s=612x612&w=0&k=20&c=nTBg2s74d-D0euEnYL91y2WmdhwNAnYIJsrnujZAqzw=',
                          nama: 'Telur',
                          carbs: '70cals',
                          protein: '8g',
                          fat: '10g',
                          warna: Colors.lightGreen,
                        ),
                        macro(
                            makanan: 'https://images.pexels.com/photos/6107764/pexels-photo-6107764.jpeg?auto=compress&cs=tinysrgb&w=600',
                            nama: 'Dada Ayam',
                            carbs: '200cals',
                            protein: '20g',
                            fat: '15',
                            warna: Colors.green.shade600,
                            )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => lvbuilder(),
              ),
            );
          }
        },
      ),
    );
  }
}

class macro extends StatelessWidget {
  final String makanan;
  final String nama;
  final String carbs;
  final String protein;
  final String fat;
  final Color warna;
  const macro({
    super.key,
    required this.makanan,
    required this.nama,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12, left: 12),
      width: 300,
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  // color: Colors.black,
                  padding: EdgeInsets.only(top: 5),
                  width: 160,
                  height: 180,
                  child: Image.network(
                    makanan,
                    fit: BoxFit.fitHeight,
                  )),
              Container(
                // color: Colors.amber,
                child: Text(
                  nama,
                  style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            height: 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(1))),
          ),
          SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 6),
                    child: Text(
                      'Carbs',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      carbs,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 6),
                    child: Text(
                      'Protein',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      protein,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 6),
                    child: Text(
                      'Fat',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      fat,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IsiList extends StatelessWidget {
  final String gambar;
  final String teks;
  final String desc;
  final Color warna;
  const IsiList({
    super.key,
    required this.gambar,
    required this.teks,
    required this.desc,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12, left: 12),
      width: 300,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.amber,
                padding: EdgeInsets.only(top: 25),
                width: 140,
                height: 150,
                child: Text(
                  teks,
                  style: GoogleFonts.leagueSpartan(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              Container(
                  // color: Colors.black,
                  padding: EdgeInsets.only(top: 5),
                  width: 130,
                  height: 150,
                  child: Image.asset(
                    gambar,
                    fit: BoxFit.fitHeight,
                  )),
            ],
          ),
          Container(
            height: 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(1))),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 6),
            child: Text(
              desc,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("pencet");
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              minimumSize: Size(250, 30),
            ),
            child: Text(
              'Mulai',
              style: GoogleFonts.roboto(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700),
            ),
          )
        ],
      ),
    );
  }
}

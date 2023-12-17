import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projek_uts/model/data.dart';
import 'package:projek_uts/model_view/fetch_api.dart';
import 'package:projek_uts/view/DetailPage.dart';
import 'package:projek_uts/view/detailmakanan.dart';
import 'package:projek_uts/view/profilepage.dart';
import 'lvbuilder.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatelessWidget {
  final dt = listdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
        title: Text('Exercise & Nutrition App'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          height: 680,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Rekomendasi Latihan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(dt[index].imageUrls,
                                  data: dt[index]);
                            },
                          ),
                        );
                      },
                      child: BackdropFilter(
                        filter: ImageFilter.blur(),
                        child: Container(
                          width: 300,
                          height: 200,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: EdgeInsets.only(left: 16, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(dt[index].imageUrls),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                                color: Colors.grey.shade600, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // height: 100,
                                width: 100,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  color: Colors.grey.withOpacity(.6),
                                ),
                                child: Center(
                                  child: Text(
                                    dt[index].tekspertama,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // height: 100,
                                width: 100,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  color: Colors.grey.withOpacity(.6),
                                ),
                                child: Center(
                                  child: Text(
                                    dt[index].tekskedua,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Nutrisi Makanan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                margin: EdgeInsets.only(top: 12),
                height: 308,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        macro(),
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
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => homepage(),
                ),
              );
              break;
            case 1:
              // Navigasi ke halaman Exercise (lvbuilder)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => lvbuilder(),
                ),
              );
              break;
            case 2:
              // Navigasi ke halaman ProfilePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
              break;
          }
        },
        currentIndex: 0,
      ),
    );
  }
}

class macro extends StatefulWidget {
  @override
  State<macro> createState() => _macroState();
}

class _macroState extends State<macro> {
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 12, left: 12),
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: FutureBuilder(
          future: repo.fetchDataPlaces(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var food = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Detailmakanan(
                            food: food,
                          );
                        },
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.grey.shade600, width: 1.5),
                        color: Colors.white38,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 160,
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(food.gambar),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(food.nama,
                                    style: GoogleFonts.leagueSpartan(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.black,
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 2,
                            width: 145,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            width: 124,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'Carbs',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        food.karbohidrat, // Replace with actual carbs data
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'Protein',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        food.protein, // Replace with actual protein data
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'Fat',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        food.fat, // Replace with actual fat data
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}


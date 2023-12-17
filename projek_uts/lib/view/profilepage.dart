import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projek_uts/Login/login.dart';
import 'package:projek_uts/view/homepage.dart';
import 'package:projek_uts/view/lvbuilder.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  int _userAge = 0;
  User? _currentUser;

  int _generateRandomAge() {
    Random random = Random();
    return random.nextInt(25 - 19 + 1) + 19;
  }

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      setState(() {
        _userAge = _generateRandomAge();
      });
    }
  }

  // Function untuk mengambil nama dari email
  String _getNameFromEmail(String email) {
    return email.split('@')[0]; // Mengambil bagian sebelum "@" sebagai nama
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
         actions: [
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.logout, color: Colors.black)),
          )
        ],

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
        currentIndex: 2,
      ),
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 26),
              width: 250,
              height: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pinimg.com/280x280_RS/0e/a7/89/0ea7898a9de41174727994ba88177e15.jpg',
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit
                            .cover, // Opsional: untuk mengatur cara gambar ditampilkan
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        _getNameFromEmail(_currentUser?.email ?? ''),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey.shade800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        _currentUser?.email ?? ' ' 'Email@example.com',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        'Umur',
                        style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '$_userAge tahun',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800
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
  }
}

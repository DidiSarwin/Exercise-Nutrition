import 'package:flutter/material.dart';
import 'package:projek_uts/model/data.dart';
import 'package:projek_uts/view/DetailPage.dart';
import 'package:projek_uts/view/homepage.dart';
import 'package:projek_uts/view/profilepage.dart';

class lvbuilder extends StatelessWidget {
  const lvbuilder({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Latihan'),
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
        currentIndex: 1,
      ),
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
          
          padding: EdgeInsets.all(12),
          itemCount: listdata.length * 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                padding: EdgeInsets.only(top: 12),
                alignment: Alignment.center,
                child: Text(
                  "Home Workout",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              );
            } else if (index == 11) {
              return Container(
                padding: EdgeInsets.only(top: 24, bottom: 12),
                alignment: Alignment.center,
                child: Text(
                  "GYM Workout",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              );
            } else if (index.isOdd) {
              return SizedBox(
                height: 15,
              ); // Ini adalah separator
            }
      
            final arj = listdata[(index ~/ 2) - 1];
      
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(arj.imageUrls, data: arj);
                    },
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(arj.imageUrls),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey.shade600, width: 3),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            arj.tekspertama,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            arj.tekskedua,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

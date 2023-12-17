import 'package:flutter/material.dart';
import 'package:projek_uts/model/makanan.dart';
import 'package:projek_uts/model_view/fetch_api.dart';

class Detailmakanan extends StatefulWidget {
  final Makanan food;
  Detailmakanan({Key? key, required this.food});

  @override
  State<Detailmakanan> createState() => _DetailmakananState();
}

class _DetailmakananState extends State<Detailmakanan> {
  Repository repo = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.food.nama,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          child: FutureBuilder(
        future: repo.fetchDataPlaces(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.only(top: 32, bottom: 32, left: 8, right: 8),
              color: Colors.grey,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade600, width: 2),
                        image: DecorationImage(
                          image: NetworkImage(widget.food.gambar),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade600, width: 2),
                      color: Colors.white70,
                    ),
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 24),
                    width: double.infinity,
                    height: 203,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Center(
                              child: Text(
                            'Nutrisi Makanan',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.black,
                          height: 0.9,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '        Kalori            :  ${widget.food.kalori}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '        Protein         :  ${widget.food.protein}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '        Lemak          :  ${widget.food.fat}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '        Karbohidrat :  ${widget.food.karbohidrat}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}

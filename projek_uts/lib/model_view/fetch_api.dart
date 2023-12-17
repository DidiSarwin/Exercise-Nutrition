import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:projek_uts/model/makanan.dart';
import 'dart:convert';

class Repository {
  final String apiUrl =
      "https://exercise-and-nutrition-api-default-rtdb.firebaseio.com/jsondata/makanan.json?auth=C9ND8Nd98PRcf732TA9d1yWA2pisrutlsPe84d2o";

  Future<List<Makanan>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Makanan> dataPlaces;
    if (response.statusCode == 200) {
      List<dynamic> listJson = json.decode(response.body)["makanan"];
      dataPlaces = listJson.map((e) => Makanan.fromJson(e)).toList();

      print(dataPlaces);
      return dataPlaces;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

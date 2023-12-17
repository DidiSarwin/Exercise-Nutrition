import 'dart:convert';

Makanan makananFromJson(String str) => Makanan.fromJson(json.decode(str));

String makananToJson(Makanan data) => json.encode(data.toJson());

class Makanan {
    final String fat;
    final String gambar;
    final String karbohidrat;
    final String nama;
    final String protein;
    final String kalori;

    Makanan({
        required this.fat,
        required this.gambar,
        required this.karbohidrat,
        required this.nama,
        required this.protein,
        required this.kalori,
    });

    factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
        fat: json["fat"],
        gambar: json["gambar"],
        karbohidrat: json["karbohidrat"],
        nama: json["nama"],
        protein: json["protein"],
        kalori: json["kalori"],
    );

    Map<String, dynamic> toJson() => {
        "fat": fat,
        "gambar": gambar,
        "karbohidrat": karbohidrat,
        "nama": nama,
        "protein": protein,
        "kalori": kalori,
    };
}

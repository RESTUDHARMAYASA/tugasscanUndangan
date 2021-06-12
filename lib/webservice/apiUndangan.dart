import 'dart:convert';
import 'package:flutter_application_1/model/Undangan.dart';
import 'package:http/http.dart' as http;

class ApiUndangan {
  final url = "http://127.0.0.2/undangan/getListUndangan.php";
  Future<List<Undangan>?> getUndanganAll() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return undanganFromJson(response.body);
    } else {
      print("Error ${response.toString()}");
      return null;
    }
  }

  //cek status kehadiran
  Future<Undangan?> cekUndangan(String email) async {
    final response = await http.get(
        Uri.parse("http://127.0.0.2/undangan/cekUndangan.php?email=$email"));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Undangan.fromJson(result[0]);
    } else {
      print("Error ${response.toString()}");
      return null;
    }
  }

  //ubah status kehadiran
  Future<bool> updateKehadiran(Undangan undangan) async {
    final response = await http.get(Uri.parse(
        "http://127.0.0.2/undangan/updateKehadiran.php?undangan_id=${undangan.undanganId}"));
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  //reset kehadiran
  Future<bool> resetKehadiran() async {
    final response = await http
        .get(Uri.parse("http://127.0.0.2/undangan/resetKehadiran.php"));
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}

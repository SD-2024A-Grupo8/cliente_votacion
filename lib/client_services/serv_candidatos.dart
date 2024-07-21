import 'package:cliente_votacion/config/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cliente_votacion/models/candidato.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

class CandidatoNotifier extends StateNotifier<List<Candidato>> {
  CandidatoNotifier() : super([]){
    fetchCandidatos();
  }

  Future<void>  fetchCandidatos() async {
    const url = 'http://18.228.119.181/elecciones/candidatos/0';
    
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${LocalStorageAuth.getToken()}',
        }
      );
      print("response ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        state = jsonData.map((item) => Candidato.fromJson(item)).toList();
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
import 'package:cliente_votacion/config/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cliente_votacion/models/proceso.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

class ProcesoNotifier extends StateNotifier<List<Proceso>> {
  ProcesoNotifier() : super([]){
    fetchProcesos();
  }

  Future<void>  fetchProcesos() async {
    const url = 'http://18.228.119.181/elecciones/proces';
    
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
        state = jsonData.map((item) => Proceso.fromJson(item)).toList();
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void>  createProcesos(Proceso dept) async {
    const url = 'http://localhost:8080/elecciones/create';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(dept.toJson()),
      );

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);
        state = [...state, Proceso.fromJson(jsonData)];
      }
    } catch (e) {
      // Manejo de errores
    }
  }

  Future<void> deleteProceso(int? id) async {
    final url = 'http://localhost:8080/elecciones/delete/$id';
    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        state = state.where((ingeniero) => ingeniero.id != id).toList();
      }
    } catch (e) {
      // Manejo de errores
    }
  }
}
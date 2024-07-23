import 'package:cliente_votacion/config/local_storage.dart';
import 'package:cliente_votacion/config/urls.dart';
import 'package:http/http.dart' as http;
import 'package:cliente_votacion/models/proceso.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

class ProcesoNotifier extends StateNotifier<List<Proceso>> {
  ProcesoNotifier() : super([]){
    fetchProcesos();
  }

  Future<void>  fetchProcesos() async {
    const url = '$ELECCIONES_URL/elecciones';
    
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
      // Manejo de errores
    }
  }

  Future<void>  createProceso(Proceso proceso) async {
    const url = '$ELECCIONES_URL/elecciones';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${LocalStorageAuth.getToken()}'
        },
        body: jsonEncode(proceso.toJson()),
        
      );

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);
        //state = [...state, Proceso.fromJson(jsonData)];
      }
    } catch (e) {
      // Manejo de errores
    }
  }

  Future<void> deleteProceso(int? id) async {
    final url = '$ELECCIONES_URL/elecciones/$id';
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorageAuth.getToken()}'
        }
      );

      if (response.statusCode == 200) {
        state = state.where((proceso) => proceso.id != id).toList();
      }
    } catch (e) {
      // Manejo de errores
    }
  }
}
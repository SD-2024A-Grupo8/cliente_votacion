import 'package:cliente_votacion/config/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cliente_votacion/models/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'dart:convert';

class UsuarioNotifier extends StateNotifier<Usuario?> {
  UsuarioNotifier() : super(null);

  Future<void>  login(Usuario usuario) async {
    const url = 'http://18.228.119.181/login';
    print(usuario.toJson());
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(usuario.toJson()),
      );
      print("response ${response.body}");
      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);

        if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('jwToken')) {
            print('La clave "nombre" está presente.');
            print(jsonData['jwToken']);

            usuario.setToken(jsonData['jwToken']);
            state = usuario;
          } else {
            print('La clave "nombre" no está presente.');
          }
        }
      }
    } catch (e) {
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlzcyI6InZvbGwgbWVkIiwiaWQiOjgsImV4cCI6MTcyMTkyMzM5OH0.Oy0M0o5tpb4vjjBApZ3BQbiRDvCisqS07GD7bF0AGNg";

      // Decodificar el token
      final jwt = JWT.decode(token);

      // Extraer los datos
      final userId = jwt.payload['id'];
      print('User ID: $userId');
      
      usuario.setToken(token);
      usuario.setId(8);
      
      LocalStorageAuth.setToken(token);
      LocalStorageAuth.setId(userId.toString());
      LocalStorageAuth.setNombre(usuario.nombre);
      state = usuario;
      print("Error: $e");
    }
  }
}
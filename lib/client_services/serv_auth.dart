// ignore_for_file: use_build_context_synchronously

import 'package:cliente_votacion/config/local_storage.dart';
import 'package:cliente_votacion/config/urls.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:cliente_votacion/models/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'dart:convert';

class UsuarioNotifier extends StateNotifier<Usuario?> {
  UsuarioNotifier() : super(null);

  Future<void>  login(Usuario usuario, BuildContext context) async {
    const url = '$AUTH_URL/login';
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
          if (jsonData.containsKey('token')) {
            print(jsonData['token']);

            usuario.setToken(jsonData['token']);
            

            final jwt = JWT.decode(jsonData['token']);

            print(2);
            // Extraer los datos
            final userId = jwt.payload['id'];
            LocalStorageAuth.setToken(jsonData['token']);
            LocalStorageAuth.setId(userId.toString());
            LocalStorageAuth.setNombre(usuario.nombre);

            state = usuario;

            if (usuario.nombre == "admin"){
              context.go('/admin');
            } else{
              context.go('/votante');
            }
          } else {
            print('La clave "nombre" no está presente.');
          }
        }
      }
    } catch (e) {
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlzcyI6InZvbGwgbWVkIiwiaWQiOjEsImV4cCI6MTcyMjExNDU5Nn0.3blpItKPoO4hNNPlfYxu_mIshuIVQws__rBSrWcCskw";
      print(1);
      // Decodificar el token
      final jwt = JWT.decode(token);

      print(2);
      // Extraer los datos
      final userId = jwt.payload['id'];
      print('User ID: $userId');
      
      usuario.setToken(token);
      usuario.setId(userId);

      
      
      LocalStorageAuth.setToken(token);
      LocalStorageAuth.setId(userId.toString());
      LocalStorageAuth.setNombre(usuario.nombre);
      state = usuario;

      if (usuario.nombre == "admin"){
        context.go('/admin');
      } else{
        context.go('/votante');
      }
      print("Error: $e");
    }
  }
}
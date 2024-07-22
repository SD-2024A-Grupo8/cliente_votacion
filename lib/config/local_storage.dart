import 'package:localstorage/localstorage.dart';

class LocalStorageAuth {
  static void setToken(String value) {
    localStorage.setItem('token', value);
  }

  static String getToken(){
    return localStorage.getItem('token') as String;
  }

  static void setNombre(String value) {
    localStorage.setItem('nombre', value);
  }

  static String getNombre(){
    String nombre = localStorage.getItem('nombre')??"Usuario";
    return nombre;
  }

  static String getId(){
    return localStorage.getItem('id') as String;
  }

  static void setId(String value) {
    localStorage.setItem('id', value);
  }
}
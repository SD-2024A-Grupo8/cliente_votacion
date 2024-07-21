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
    return localStorage.getItem('nombre') as String;
  }
}
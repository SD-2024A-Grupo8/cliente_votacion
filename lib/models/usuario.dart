class Usuario {
  int? id;
  final String nombre;
  final String contrasenia;
  String? token;

  Usuario({this.id, required this.nombre, required this.contrasenia, this.token});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'] as String,
      contrasenia: json['contrasenia'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'contrasenia': contrasenia,
    };
  }

  void setToken(String? newToken) {
    token = newToken;
  }

  void setId(int? userId) {
    id = userId;
  }
}
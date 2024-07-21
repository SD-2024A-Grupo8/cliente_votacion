class Candidato{
  int? id;
  String nombre;

  Candidato({
    this.id,
    required this.nombre,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
    };
  }

  factory Candidato.fromJson(Map<String, dynamic> json) {
    return Candidato(
      id: json['id']??0,
      nombre: json['nombre'] as String
    );
  }
}
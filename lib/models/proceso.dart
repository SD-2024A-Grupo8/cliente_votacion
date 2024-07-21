class Proceso{
   int? id;
   String nameEleccion;
   String description;
   String fechaInicio;
   String fechaFin;
   List<int>? candidatosId;
   bool estado;

   Proceso({
    this.id,
    required this.nameEleccion,
    required this.description,
    required this.fechaInicio,
    required this.fechaFin,
    this.candidatosId,
    required this.estado,
  });

  Map<String, dynamic> toJson() {
    return {
      'nameEleccion': nameEleccion,
      'description': description,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'candidatosId': candidatosId,
      'estado': estado,
    };
  }

  factory Proceso.fromJson(Map<String, dynamic> json) {
    return Proceso(
      id: json['id']??0,
      nameEleccion: json['nameEleccion'] as String,
      description: json['description'] as String,
      fechaInicio: json['fechaInicio'] as String,
      fechaFin: json['fechaFin'] as String,
      candidatosId: List<int>.from(json['candidatosId']),
      estado: json['estado'] as bool,
    );
  }
}
class EstadioModelo {
  EstadioModelo({
    this.id,
    required this.nombre,
    required this.fechaFundacion,
    required this.ubicacion,
    required this.propietario,
    required this.capacidad,
    required this.disponible,
  });

  String? id;
  String nombre;
  DateTime fechaFundacion;
  String ubicacion;
  String propietario;
  String capacidad;
  bool disponible;

  factory EstadioModelo.fromJson(Map<String, dynamic> json) => EstadioModelo(
        id: json["id"],
        nombre: json["nombre"],
        fechaFundacion: DateTime.parse(json["fechaFundacion"]),
        ubicacion: json["ubicacion"],
        propietario: json["propietario"],
        capacidad: json["capacidad"],
        disponible: json["disponible"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "fechaFundacion": fechaFundacion.toIso8601String(),
        "ubicacion": ubicacion,
        "propietario": propietario,
        "capacidad": capacidad.toString(),
        "disponible": disponible,
      };
}

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
  String fechaFundacion;
  String ubicacion;
  String propietario;
  int capacidad;
  bool disponible;

  factory EstadioModelo.fromJson(Map<String, dynamic> json) => EstadioModelo(
        id: json["id"],
        nombre: json["nombre"],
        fechaFundacion: json["fecha_fundacion"],
        ubicacion: json["ubicacion"],
        propietario: json["propietario"],
        capacidad: json["capacidad"],
        disponible: json["disponible"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "fecha_fundacion": fechaFundacion,
        "ubicacion": ubicacion,
        "propietario": propietario,
        "capacidad": capacidad,
        "disponible": disponible,
      };
}

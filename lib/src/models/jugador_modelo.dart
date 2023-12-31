class JugadorModelo {
  JugadorModelo({
    this.id,
    required this.nombre,
    required this.nacionalidad,
    required this.email,
    required this.status,
    required this.ultimoEquipo,
  });

  String? id; //el simbolo ? indica que puede ser null el valor
  String nombre;
  String nacionalidad;
  String email;
  bool status;
  String ultimoEquipo;

  factory JugadorModelo.fromJson(Map<String, dynamic> json) => JugadorModelo(
        id: json["id"],
        nombre: json["nombre"],
        nacionalidad: json["nacionalidad"],
        email: json["email"],
        status: json["status"],
        ultimoEquipo: json["ultimoEquipo"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "nacionalidad": nacionalidad,
        "email": email,
        "status": status,
        "ultimoEquipo": ultimoEquipo,
      };
}

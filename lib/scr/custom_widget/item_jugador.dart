import 'package:flutter/material.dart';
import 'package:flutter_application_1/scr/models/jugador_modelo.dart';

class ItemJugador extends StatelessWidget {
  final JugadorModelo jugador;

  const ItemJugador({
    Key? key,
    required this.jugador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(jugador.nombre),
        subtitle: Text(jugador.ultimoEquipo),
      ),
    );
  }
}

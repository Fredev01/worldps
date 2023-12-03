import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list_jugador.dart';
import 'package:flutter_application_1/src/models/jugador_modelo.dart';
import 'package:get/get.dart';

class ItemJugador extends StatelessWidget {
  final JugadorModelo jugador;

  const ItemJugador({
    Key? key,
    required this.jugador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerListJugador ctrJugador = Get.find();

    Color color = jugador.status ? Colors.white : Colors.grey;
    IconData icon = jugador.status ? Icons.check : Icons.cancel;

    return Card(
      color: color,
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.green,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.edit),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.delete),
        ),
        onDismissed: ((direction) => {
              if (direction == DismissDirection.endToStart)
                {ctrJugador.delete(jugador)}
              else
                {
                  Get.toNamed('jugador', arguments: {
                    'id': jugador.id,
                    'nombre': jugador.nombre,
                    'nacionalidad': jugador.nacionalidad,
                    'email': jugador.email,
                    'status': jugador.status,
                    'ultimoEquipo': jugador.ultimoEquipo,
                  })
                }
            }),
        child: ListTile(
          title: Text(jugador.nombre),
          subtitle: Text(jugador.ultimoEquipo),
          trailing: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

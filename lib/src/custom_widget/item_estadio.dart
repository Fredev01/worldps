import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list_estadio.dart';
import 'package:flutter_application_1/src/models/estadio_modelo.dart';
import 'package:get/get.dart';

class ItemEstadio extends StatelessWidget {
  final EstadioModelo estadio;

  const ItemEstadio({
    Key? key,
    required this.estadio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerListEstadio ctrEstadio = Get.find();

    Color color = estadio.disponible ? Colors.white : Colors.grey;
    IconData icon = estadio.disponible ? Icons.check : Icons.cancel;

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
                {ctrEstadio.delete(estadio)}
              else
                {
                  Get.toNamed('estadio', arguments: {
                    'id': estadio.id,
                    'nombre': estadio.nombre,
                    'fechaFundacion ': estadio.fechaFundacion,
                    'ubicacion': estadio.ubicacion,
                    'propietario': estadio.propietario,
                    'capacidad': estadio.capacidad,
                    'disponible': estadio.disponible,
                  })
                }
            }),
        child: ListTile(
          title: Text(estadio.nombre),
          subtitle: Text(estadio.propietario),
          trailing: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

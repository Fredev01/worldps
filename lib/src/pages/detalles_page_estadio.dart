import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_item.dart';
import 'package:flutter_application_1/src/models/estadio_modelo.dart';

class DetallesPageEstadio extends StatelessWidget {
  final EstadioModelo estadio;

  const DetallesPageEstadio({Key? key, required this.estadio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildCustomDrawerEst(),
      appBar: AppBar(
        title: const Text(
          'Detalles del estadio',
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    List<String> nombres = [
      'Nombre del estadio',
      // 'Fecha de fundacion',
      'Ubicacion',
      'Dueño',
      'Capacidad',
      'Estado',
    ];

    List<String> valores = [
      estadio.nombre,
      // estadio.fechaFundacion,
      estadio.ubicacion,
      estadio.propietario,
      estadio.capacidad.toString(),
      estadio.disponible ? 'Mantenimiento' : 'Activo',
    ];

    List<Widget> formularios = [];

    for (int i = 0; i < nombres.length; i++) {
      formularios.add(
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              color: Color.fromARGB(255, 236, 236, 236),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      nombres[i],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      valores[i],
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
          children: formularios,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:worldps/src/models/jugador_modelo.dart';

class DetallesPage extends StatelessWidget {
  final JugadorModelo jugador;

  const DetallesPage({Key? key, required this.jugador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalles del jugador',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    List<String> nombres = [
      'Nombre',
      'Fecha de Nacimiento',
      'Nacionalidad',
      'Email',
      'Status',
      'Ultimo Equipo',
    ];

    List<String> valores = [
      jugador.nombre,
      jugador.fechaNacimiento,
      jugador.nacionalidad,
      jugador.email,
      jugador.status ? 'Activo' : 'Retirado',
      jugador.ultimoEquipo,
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

import 'package:flutter/material.dart';
import 'package:worldps/src/custom_widget/drawer_item.dart';

class DetallesPage extends StatelessWidget {
  const DetallesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detalles del jugador',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalles del jugador',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: cuerpo(context),
        bottomNavigationBar: const BNavigator(),
      ),
    );
  }
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
    'Chicharito',
    '12/11/1999',
    'México',
    'chicharo@gmail.com',
    'Activo',
    'Cruz azul',
  ];

  List<Widget> formularios = [];

  for (int i = 0; i < nombres.length; i++) {
    formularios.add(
      Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            color: Colors.green,
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
  formularios.add(
    Center(
      child: ElevatedButton(
        onPressed: () {
          // va ser el regreso ala otra pagina
          print("Regresar");
        },
        child: const Text("Regresar"),
      ),
    ),
  );

  return ListView(
    children: formularios,
  );
}

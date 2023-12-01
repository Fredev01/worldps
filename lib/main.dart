import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldps/src/controller/controller_list_jugador.dart';
import 'package:worldps/src/models/jugador_modelo.dart'; // Asegúrate de que la ruta sea correcta
import 'package:worldps/src/pages/detalles_page.dart';
import 'package:worldps/src/pages/jugador_lista_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerListJugador());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estadios',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => JugadorListaPage()),
        GetPage(
          name: '/detalles',
          page: () {
            final jugador = Get.arguments as JugadorModelo?;
            return DetallesPage(jugador: jugador!);
          },
        ),
      ],
    );
  }
}

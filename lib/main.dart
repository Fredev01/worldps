import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list_estadio.dart';
import 'package:flutter_application_1/src/controller/controller_list_jugador.dart';
import 'package:flutter_application_1/src/pages/estadio_lista_page.dart';
import 'package:flutter_application_1/src/pages/estadio_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/jugador_lista_page.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
=======
import 'package:worldps/src/controller/controller_list_jugador.dart';
import 'package:worldps/src/models/jugador_modelo.dart';
import 'package:worldps/src/pages/detalles_page.dart';
import 'package:worldps/src/pages/estadio_lista_page.dart';
import 'package:worldps/src/pages/estadio_page.dart';
import 'package:worldps/src/pages/home_page.dart';
import 'package:worldps/src/pages/jugador_lista_page.dart';
>>>>>>> 0f142edae77c5ade23de83d005cd4e798229f812

// import 'package:worldps/src/pages/jugador_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerListJugador());
    Get.put(ControllerListEstadio());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estadios',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/Estadio', page: () => const EstadioPage()),
        GetPage(name: '/listaEstadio', page: () => EstadioListaPage()),
        GetPage(name: '/Jugadores', page: () => JugadorListaPage()),
        GetPage(
          name: '/detalles',
          page: () {
            final jugador = Get.arguments as JugadorModelo?;
            return DetallesPage(jugador: jugador!);
          },
        ),
        GetPage(name: '/jugador', page: () => const JugadorPage()),
      ],
    );
  }
}

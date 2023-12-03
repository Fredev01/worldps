import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list_estadio.dart';
import 'package:flutter_application_1/src/controller/controller_list_jugador.dart';
import 'package:flutter_application_1/src/models/estadio_modelo.dart';
import 'package:flutter_application_1/src/models/jugador_modelo.dart';
import 'package:flutter_application_1/src/pages/detalles_page.dart';
import 'package:flutter_application_1/src/pages/detalles_page_estadio.dart';
import 'package:flutter_application_1/src/pages/estadio_lista_page.dart';
import 'package:flutter_application_1/src/pages/estadio_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/jugador_lista_page.dart';
import 'package:flutter_application_1/src/pages/jugador_page.dart';
import 'package:get/get.dart';

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
        GetPage(
          name: '/detallesEstadio',
          page: () {
            final estadio = Get.arguments as EstadioModelo?;
            return DetallesPageEstadio(estadio: estadio!);
          },
        ),
        GetPage(name: '/jugador', page: () => const JugadorPage()),
        GetPage(name: '/estadio', page: () => const EstadioPage()),
      ],
    );
  }
}

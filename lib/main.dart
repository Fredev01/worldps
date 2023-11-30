import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldps/src/controller/controller_list_jugador.dart';
import 'package:worldps/src/pages/estadio_lista_page.dart';
import 'package:worldps/src/pages/estadio_page.dart';
import 'package:worldps/src/pages/home_page.dart';
import 'package:worldps/src/pages/jugador_lista_page.dart';

import 'package:worldps/src/pages/jugador_page.dart';

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
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/Estadio', page: () => const EstadioPage()),
        GetPage(name: '/listaEstadio', page: () => const EstadioListaPage()),
        GetPage(name: '/Jugadores', page: () => JugadorListaPage()),
        // GetPage(name: '/listaJugadores', page: () => const Listaj()),
      ],
    );
  }
}

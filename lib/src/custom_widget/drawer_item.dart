import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/estadio_page.dart';
import 'package:flutter_application_1/src/pages/jugador_page.dart';
import 'package:get/get.dart';

class BNavigator extends StatelessWidget {
  const BNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.stadium), label: 'Estadios'),
        BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Jugadores'),
      ],
      backgroundColor: Color.fromARGB(255, 254, 252, 252),
      currentIndex: Get.currentRoute == '/home' ? 0 : 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/home');
            break;
          case 1:
            Get.toNamed('/Estadio');
            break;
          case 2:
            Get.toNamed('/Jugadores');
            break;
          case 3:
            Get.toNamed('/listaEstadio');
            break;
        }
      },
    );
  }
}

class AddEstadio extends StatelessWidget {
  const AddEstadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => const EstadioPage());
      },
      child: const Icon(Icons.add),
    );
  }
}

class AddJugador extends StatelessWidget {
  const AddJugador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => const JugadorPage());
      },
      child: const Icon(Icons.add),
    );
  }
}

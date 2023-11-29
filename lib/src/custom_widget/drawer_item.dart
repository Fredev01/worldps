import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:worldps/src/pages/estadio_page.dart';

class BNavigator extends StatelessWidget {
  const BNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.stadium), label: 'Estadio'),
        BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Jugadores'),
        BottomNavigationBarItem(icon: Icon(Icons.stadium), label: 'Estadios'),
      ],
      currentIndex: Get.currentRoute == '/home' ? 0 : 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/home');
            break;
          case 1:
            Get.toNamed('/Estadio');

            Get.toNamed('/Jugadores');
            break;
          case 1:
            Get.toNamed('/listaEstadio');
            break;
        }
      },
    );
  }
}

class AddEstadio extends StatelessWidget {
  const AddEstadio({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EstadioPage()),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

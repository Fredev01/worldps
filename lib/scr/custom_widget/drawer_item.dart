import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BNavigator extends StatelessWidget {
  const BNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.stadium), label: 'Estadio'),
      ],
      currentIndex: Get.currentRoute == '/home' ? 0 : 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/home');
            break;
          case 1:
            Get.toNamed('/Estadio');
            break;
        }
      },
    );
  }
}

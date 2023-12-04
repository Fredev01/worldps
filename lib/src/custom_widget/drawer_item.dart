import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/estadio_page.dart';
import 'package:flutter_application_1/src/pages/jugador_page.dart';
import 'package:get/get.dart';

class DrawerItEstadio extends StatelessWidget {
  const DrawerItEstadio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white, // Color de fondo blanco
          child: ListTile(
            title: const Text('Pagina Principal'),
            onTap: () => Get.offNamed('home'),
          ),
        ),
        Container(
          color: Colors.white, // Color de fondo blanco
          child: ListTile(
            title: const Text('Estadios'),
            onTap: () => Get.offNamed('listaEstadio'),
          ),
        ),
        Container(
          color: Colors.white, // Color de fondo blanco
          child: ListTile(
            title: const Text('Jugadores'),
            onTap: () => Get.offNamed('Jugadores'),
          ),
        ),
      ],
    );
  }
}

class DrawerDetEstadio extends StatelessWidget {
  const DrawerDetEstadio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white, // Color de fondo blanco
          child: ListTile(
            title: const Text('Estadios'),
            onTap: () => Get.offNamed('listaEstadio'),
          ),
        ),
      ],
    );
  }
}

class DrawerDetJugadores extends StatelessWidget {
  const DrawerDetJugadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white, // Color de fondo blanco
          child: ListTile(
            title: const Text('Jugadores'),
            onTap: () => Get.offNamed('Jugadores'),
          ),
        ),
      ],
    );
  }
}

class BNavigator extends StatelessWidget {
  const BNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Jugadores'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.stadium), label: 'Estadios'),
      ],
      backgroundColor: Color.fromARGB(255, 254, 252, 252),
      currentIndex: Get.currentRoute == '/home' ? 0 : 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/Jugadores');
            break;
          case 1:
            Get.toNamed('/home');
            break;
          case 2:
            Get.toNamed('/listaEstadio');
            break;
        }
      },
    );
  }
}

class NavListEsta extends StatelessWidget {
  const NavListEsta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.stadium), label: 'Estadios'),
      ],
      backgroundColor: Color.fromARGB(255, 254, 252, 252),
      currentIndex: Get.currentRoute == '/home' ? 0 : 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/home');
            break;
          case 1:
            Get.toNamed('/listaEstadio');
            break;
        }
      },
    );
  }
}

class NavListJoga extends StatelessWidget {
  const NavListJoga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Jugadores'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      ],
      backgroundColor: Color.fromARGB(255, 254, 252, 252),
      currentIndex: Get.currentRoute == '/home' ? 0 : 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/Jugadores');
            break;
          case 1:
            Get.toNamed('/home');
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

Widget buildCustomDrawer() {
  return Drawer(
    child: Container(
      color: Colors.green,
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                Image.asset('assets/images/WorldPSLogo.png', height: 150),
                Image.asset('assets/images/TypoWorldPS.png', height: 50),
              ],
            ),
          ),
          const DrawerItEstadio(),
        ],
      ),
    ),
  );
}

Widget buildCustomDrawerEst() {
  return Drawer(
    child: Container(
      color: Colors.green,
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                Image.asset('assets/images/WorldPSLogo.png', height: 150),
                Image.asset('assets/images/TypoWorldPS.png', height: 50),
              ],
            ),
          ),
          const DrawerDetEstadio(),
        ],
      ),
    ),
  );
}

Widget buildCustomDrawerJuga() {
  return Drawer(
    child: Container(
      color: Colors.green,
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                Image.asset('assets/images/WorldPSLogo.png', height: 150),
                Image.asset('assets/images/TypoWorldPS.png', height: 50),
              ],
            ),
          ),
          const DrawerDetJugadores(),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:worldps/scr/custom_widget/drawer_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estadios de Futbol"),
      ),
      bottomNavigationBar: const BNavigator(),
      floatingActionButton: const AddEstadio(),
    );
  }
}

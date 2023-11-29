import 'package:flutter/material.dart';
import 'package:worldps/src/custom_widget/drawer_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Principal"),
      ),
      bottomNavigationBar: const BNavigator(),
      // floatingActionButton: const AddEstadio(),
    );
  }
}

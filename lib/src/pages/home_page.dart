import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_item.dart';

// import 'package:worldps/src/custom_widget/drawer_item.dart';
//import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildCustomDrawer(),
      appBar: AppBar(
        title: const Text("Pagina Principal"),
      ),
      // floatingActionButton: const AddEstadio(),
    );
  }
}

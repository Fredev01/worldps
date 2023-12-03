import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list_estadio.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_item.dart';
import 'package:flutter_application_1/src/custom_widget/item_estadio.dart';
import 'package:get/get.dart';

class EstadioListaPage extends StatelessWidget {
  EstadioListaPage({super.key});
  final ControllerListEstadio ctr = Get.put(ControllerListEstadio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildCustomDrawer(),
      appBar: AppBar(
        title: const Text('Lista de Estadios'),
        // automaticallyImplyLeading: false,
      ),
      body: Obx(() => ListView.builder(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          itemCount: ctr.listaEstadio.length,
          itemBuilder: (BuildContext context, int index) {
            var estadio = ctr.listaEstadio[index];
            return GestureDetector(
              onTap: () {
                // Mandar al direccion detalles :3
                Get.toNamed('/detallesEstadio', arguments: estadio);
              },
              child: ItemEstadio(estadio: estadio),
            );
          })),
      floatingActionButton: const AddEstadio(),
    );
  }
}

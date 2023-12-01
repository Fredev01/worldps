import 'package:flutter/material.dart';
import 'package:flutter_application_1/scr/controller/controller_list_estadio.dart';
import 'package:flutter_application_1/scr/custom_widget/drawer_item.dart';
import 'package:get/get.dart';
// import 'package:worldps/scr/pages/estadio_page.dart';

class EstadioListaPage extends StatelessWidget {
  EstadioListaPage({super.key});
  final ControllerList ctr = Get.put(ControllerList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de estadios'),
      ),
      body: Obx(() => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ctr.listaEstadio.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(ctr.listaEstadio[index].nombre),
                subtitle: Text(ctr.listaEstadio[index].propietario),
              ),
            );
          })),
      floatingActionButton: const AddEstadio(),
    );
  }
}

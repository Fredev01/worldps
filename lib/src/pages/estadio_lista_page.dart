import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:worldps/src/controller/controller_list_estadio.dart';
import 'package:worldps/src/custom_widget/drawer_item.dart';
=======
import 'package:flutter_application_1/src/custom_widget/drawer_item.dart';
// import 'package:worldps/src/custom_widget/drawer_item.dart';
>>>>>>> 9dd911c527c34a86eefdd42b97b5adcab9366269
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

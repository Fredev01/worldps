import 'package:flutter/material.dart';
import 'package:flutter_application_1/scr/custom_widget/drawer_item.dart';
import 'package:flutter_application_1/scr/custom_widget/item_jugador.dart';
import 'package:flutter_application_1/src/controller/controller_list_jugador.dart';
import 'package:get/get.dart';

class JugadorListaPage extends StatelessWidget {
  JugadorListaPage({super.key});
  final ControllerListJugador ctr = Get.put(ControllerListJugador());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de jugadores'),
      ),
      body: Obx(() => ListView.builder(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          itemCount: ctr.listaJugador.length,
          itemBuilder: (BuildContext context, int index) {
            var jugador = ctr.listaJugador[index];
            return ItemJugador(jugador: jugador);
          })),
      floatingActionButton: const AddJugador(),
    );
  }
}

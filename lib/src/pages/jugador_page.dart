import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_jugador.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_item.dart';
import 'package:get/get.dart';

class JugadorPage extends StatelessWidget {
  const JugadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(ControllerPlayer());

    if (Get.arguments != null) {
      fx.setAttributes(
        Get.arguments['id'],
        Get.arguments['nombre'],
        Get.arguments['nacionalidad'],
        Get.arguments['email'],
        Get.arguments['status'],
        Get.arguments['ultimoEquipo'],
      );
    }

    return Scaffold(
      drawer: buildCustomDrawer(),
      appBar: AppBar(
        title: const Text('Nuevo jugador'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Obx(() {
                return TextFormField(
                  onChanged: fx.nameChanged,
                  controller: fx.ctrName.value,
                  decoration: InputDecoration(
                    labelText: 'Nombre del jugador',
                    errorText: fx.errorName.value,
                  ),
                );
              }),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrNationality.value,
                  onChanged: fx.nationalityChanged,
                  decoration: InputDecoration(
                    labelText: 'Nacionalidad',
                    errorText: fx.errorNationality.value,
                  ),
                );
              }),
              Obx(() {
                return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: fx.emailChanged,
                  controller: fx.ctrEmail.value,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: fx.errorEmail.value,
                  ),
                );
              }),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrLastTeam.value,
                  onChanged: fx.lastTeamChanged,
                  decoration: InputDecoration(
                    labelText: 'Último equipo',
                    errorText: fx.errorLastTeam.value,
                  ),
                );
              }),
              Obx(() {
                return SwitchListTile(
                  value: fx.playerStatus.value,
                  onChanged: fx.statusChanged,
                  title: const Text('Status'),
                );
              }),
              Obx(() {
                return ElevatedButton.icon(
                  onPressed:
                      fx.isButtonEnabledRx.value ? fx.submitFunc.value : null,
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

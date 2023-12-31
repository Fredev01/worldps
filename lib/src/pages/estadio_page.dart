import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_estadio.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_item.dart';
import 'package:get/get.dart';
// import 'package:worldps/scr/custom_widget/drawer_item.dart';

class EstadioPage extends StatelessWidget {
  const EstadioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(ControllerEstadio());
    if (Get.arguments != null) {
      fx.setAttributes(
          Get.arguments['id'],
          Get.arguments['nombre'],
          Get.arguments['ubicacion'],
          Get.arguments['propietario'],
          Get.arguments['capacidad'],
          Get.arguments['disponible']);
    }

    return Scaffold(
      drawer: buildCustomDrawer(),
      appBar: AppBar(
        title: const Text('Registrar Estadio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  onChanged: fx.nameChanged,
                  controller: fx.ctrName.value,
                  decoration: InputDecoration(
                      labelText: 'Nombre del estadio',
                      errorText: fx.errorName.value),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrPlace.value,
                  onChanged: fx.placeChanged,
                  decoration: InputDecoration(
                      labelText: 'Ubicación', errorText: fx.errorPlace.value),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrOwner.value,
                  onChanged: fx.ownerChanged,
                  decoration: InputDecoration(
                    labelText: 'Dueño',
                    errorText: fx.errorOwner.value,
                  ),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  controller: fx.ctrCapacity.value,
                  onChanged: fx.capacityChanged,
                  decoration: InputDecoration(
                    labelText: 'Capacidad del estadio',
                    errorText: fx.errorCapacity.value,
                  ),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return SwitchListTile(
                    value: fx.estadioStatus.value,
                    onChanged: fx.statusChanged,
                    title: const Text('Mantenimiento'));
              }),
              const SizedBox(height: 10),
              Obx(() {
                return ElevatedButton.icon(
                    onPressed:
                        fx.isButtonEnabledRx.value ? fx.submitFunc.value : null,
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldps/src/controller/controller_jugador.dart';

class JugadorPage extends StatelessWidget {
  const JugadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(ControllerPlayer());

    if (Get.arguments != null) {
      fx.setAttributes(
          Get.arguments['id'],
          Get.arguments['nombre'],
          Get.arguments['fechaNacimiento'],
          Get.arguments['nacionalidad'],
          Get.arguments['email'],
          Get.arguments['status'],
          Get.arguments['ultimoEquipo']);
    }
    return Scaffold(
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
                      errorText: fx.errorName.value),
                );
              }),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrBirthdate.value,
                  onTap: () {
                    _selectDate(context,
                        fx); // Función para mostrar el selector de fecha
                  },
                  decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    errorText: fx.errorBirthdate.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context,
                            fx); // Función para mostrar el selector de fecha
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                );
              }),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrNationality.value,
                  onChanged: fx.nationalityChanged,
                  decoration: InputDecoration(
                      labelText: 'Nacionalidad',
                      errorText: fx.errorNationality.value),
                );
              }),
              Obx(() {
                return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: fx.emailChanged,
                  controller: fx.ctrEmail.value,
                  decoration: InputDecoration(
                      labelText: 'Email', errorText: fx.errorEmail.value),
                );
              }),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrLastTeam.value,
                  onChanged: fx.lastTeamChanged,
                  decoration: InputDecoration(
                      labelText: 'Último equipo',
                      errorText: fx.errorLastTeam.value),
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
                    onPressed: fx.submitFunc.value,
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'));
              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, ControllerPlayer controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.playerBirthdate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2005),
      // Puedes modificar los valores de initialDate, firstDate y lastDate según tus requerimientos
    );

    if (picked != null && picked != controller.playerBirthdate.value) {
      controller.birthdateChanged(
          picked); // Actualiza la fecha seleccionada en el controlador
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list_estadio.dart';
import 'package:flutter_application_1/src/models/estadio_modelo.dart';
import 'package:flutter_application_1/src/service/estadio_service.dart';
import 'package:get/get.dart';

class ControllerEstadio extends GetxController {
  String? _id = '';
  var estadioName = ''.obs;
  var estadioPlace = ''.obs;
  var estadioOwner = ''.obs;
  var estadioCapacity = ''.obs;
  var estadioStatus = true.obs;

  // Rx<DateTime> estadioDate = Rx<DateTime>(DateTime(1980));

  bool fName = false;
  bool fPlace = false;
  bool fOwner = false;
  bool fCapacity = false;

  RxnString errorName = RxnString(null);
  RxnString errorPlace = RxnString(null);
  RxnString errorOwner = RxnString(null);
  RxnString errorCapacity = RxnString(null);
  RxBool isButtonEnabledRx = false.obs;

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  StadiumsService? service;
  ControllerListEstadio ctrlst = Get.find();

  var ctrName = TextEditingController().obs;
  var ctrPlace = TextEditingController().obs;
  var ctrOwner = TextEditingController().obs;
  var ctrCapacity = TextEditingController().obs;

  void setAttributes(
    String id,
    String nombre,
    String ubicacion,
    String propietario,
    int capacidad,
    bool disponible, // Note the change to bool?
  ) {
    _id = id;
    ctrName.value.text = nombre;
    ctrPlace.value.text = ubicacion;
    ctrOwner.value.text = propietario;
    ctrCapacity.value.text = capacidad.toString();
    estadioName.value = nombre;
    estadioPlace.value = ubicacion;
    estadioOwner.value = propietario;
    estadioCapacity.value = capacidad.toString();
    estadioStatus.value =
        disponible; // Provide a default value if disponible is null
  }

  @override
  void onInit() {
    super.onInit();
    service = StadiumsService();
    debounce<String>(
      estadioName,
      validarName,
      time: const Duration(microseconds: 500),
    );
    debounce<String>(
      estadioPlace,
      validarPlace,
      time: const Duration(microseconds: 500),
    );
    debounce<String>(
      estadioOwner,
      validarOwner,
      time: const Duration(microseconds: 500),
    );
    debounce<String>(
      estadioCapacity,
      validarCapacity,
      time: const Duration(microseconds: 500),
    );
  }

  void validarName(String val) {
    errorName.value = null;
    submitFunc.value = null;
    if (val.length > 4) {
      errorName.value = null;
      submitFunc.value = submitFunction();
      fName = true;
    } else {
      errorName.value = 'El nombre debe ser mayor a 4 caracteres';
      fName = false;
    }
    updateButtonState();
  }

  void validarCapacity(String val) {
    errorCapacity.value = null;
    submitFunc.value = null;
    if (double.tryParse(val) is double && double.parse(val) > 5000) {
      errorCapacity.value = null;
      submitFunc.value = submitFunction();
      fCapacity = true;
    } else {
      errorCapacity.value = 'Debe ser una cantidad mayor a 5000';
      fCapacity = false;
    }
    updateButtonState();
  }

  void validarPlace(String val) {
    errorPlace.value = null;
    submitFunc.value = null;
    if (val.trim().length > 5) {
      // Verificación si la ubicación es mayor a 5 caracteres
      submitFunc.value = submitFunction();
      fPlace = true;
    } else {
      errorPlace.value = 'La ubicación debe tener al menos 5 caracteres.';
      fPlace = false;
    }
    updateButtonState();
  }

  void validarOwner(String val) {
    errorOwner.value = null;
    submitFunc.value = null;
    if (val.trim().length > 3) {
      // El nombre del propietario es mayor a 3 caracteres
      submitFunc.value = submitFunction();
      fOwner = true;
    } else {
      errorOwner.value =
          'El nombre del propietario debe tener al menos 3 caracteres.';
      fOwner = false;
    }
    updateButtonState();
  }

  void nameChanged(String val) {
    estadioName.value = val;
  }

  void placeChanged(String val) {
    estadioPlace.value = val;
  }

  void ownerChanged(String val) {
    estadioOwner.value = val;
  }

  void capacityChanged(String val) {
    estadioCapacity.value = val;
  }

  void statusChanged(bool val) {
    estadioStatus.value = val;
  }

  void updateButtonState() {
    isButtonEnabledRx.value = fName && fCapacity && fPlace && fOwner;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      bool isValid = fName && fPlace && fOwner && fCapacity;
      if (isValid) {
        String? mensaje = 'se agregó un nuevo estadio';
        if (_id == '') {
          EstadioModelo estadio = EstadioModelo(
            nombre: estadioName.value,
            ubicacion: estadioPlace.value,
            propietario: estadioOwner.value,
            capacidad: int.tryParse(estadioCapacity.value) ?? 0,
            disponible: estadioStatus.value,
          );
          _id = await ctrlst.agregar(estadio);
        } else {
          EstadioModelo estadio = EstadioModelo(
            id: _id,
            nombre: estadioName.value,
            ubicacion: estadioPlace.value,
            propietario: estadioOwner.value,
            capacidad: int.tryParse(estadioCapacity.value) ?? 0,
            disponible: estadioStatus.value,
          );
          ctrlst.actualizar(estadio);
          mensaje = 'Se actualizó un estadio';
          Get.offNamed('/listaEstadio');
        }
        if (_id!.isNotEmpty) {
          ctrName.value.text = '';
          ctrPlace.value.text = '';
          ctrOwner.value.text = '';
          ctrCapacity.value.text = '';
          estadioStatus.value = true;
          Get.snackbar('Estadio', mensaje);
        }
        return true;
      } else {
        submitFunc.value = null;
        validarName(estadioName.value);
        // validarDate(estadioDate.value);
        validarPlace(estadioPlace.value);
        validarOwner(estadioOwner.value);
        validarCapacity(estadioCapacity.value);
      }
      updateButtonState(); // Llama a esta función después de validar los campos
      return isValid;
    };
  }
}

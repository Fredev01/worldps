
// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/controller/controller_list.dart';
// import 'package:flutter_application_1/src/models/producto_modelo.dart';
// import 'package:flutter_application_1/src/service/producto_service.dart';
import 'package:get/get.dart';

class ControllerEstadio extends GetxController {
  String? _id = '';
  var estadioName = ''.obs;
  // var estadioDate = ''.obs;
  var estadioPlace = ''.obs;
  var estadioOwner = ''.obs;
  var estadioCapacity = ''.obs;
  var estadioStatus = true.obs;

  Rx<DateTime> stadiumDate= Rx<DateTime>(DateTime(1980));

  bool fName = false;
  bool fDate = false;
  bool fPlace = false;
  bool fOwner = false;
  bool fCapacity = false;


  RxnString errorName = RxnString(null);
  RxnString errorDate = RxnString(null);
  RxnString errorPlace = RxnString(null);
  RxnString errorOwner = RxnString(null);
  RxnString errorCapacity = RxnString(null);}

  Rxn<Function()> submitFunc = Rxn<Function()>(null);
  

  StadiumsService? service;
  ControllerEstadio ctrlst = Get.find();

  var ctrName = TextEditingController().obs;
  var ctrDate = TextEditingController().obs;
  var ctrPlace = TextEditingController().obs;
  var ctrOwner = TextEditingController().obs;
  var ctrCapacity = TextEditingController().obs;

  void setAttributes(String id, String nombre, DateTime fechaFundacion, String ubicacion, 
  String propietario,double capacidad, bool disponible) {
    _id = id;
    ctrName.value.text = nombre;
    ctrDate.value.text = fechaFundacion.toIso8601String();
    ctrPlace.value.text = ubicacion;
    ctrOwner.value.text = propietario;
    ctrCapacity.value.text = capacidad.toString();
    estadioName.value = nombre;
    estadioDate.value = fechaFundacion;
    estadioPlace.value = ubicacion;
    estadioOwner.value = propietario;
    estadioCapacity.value = capacidad;
    estadioStatus.value = disponible;
  }

  @override
  void onInit() {
    super.onInit();

    service = StadiumsService();

    debounce<String>(estadioName, validarName,
        time: const Duration(microseconds: 500));
     debounce<String>(estadioPlace, validarPlace,
        time: const Duration(microseconds: 500));
         debounce<String>(estadioOwner, validarOwner,
        time: const Duration(microseconds: 500));
    debounce<String>(estadioCapacity, validarCapacity,
        time: const Duration(microseconds: 500));
  }

  void validarName(String val) {
    errorName.value = null;
    submitFunc.value = null;
    if (val.length > 4) {
      errorName.value = null;
      submitFunc.value = submitFunction();
      fName = true;
    } else {
      errorName.value = 'El nombre debe ser mayor a 4 digitos';
      fName = false;
    }
  }

    void validarDate(DateTime val) {
    errorDate.value = null;
    submitFunc.value = null;
    final currentDate = DateTime.now();
    if (val.isAfter(currentDate)) {
      errorDate.value = 'La fecha de fundacion no puede ser en el futuro';
      fDate = false;
    } else {
      // Validación exitosa
      submitFunc.value = submitFunction();
      fDate = true;
      errorDate.value = null;
    }
  }

  void validarCapacity(String val) {
    errorCapacity.value = null;
    submitFunc.value = null;
    if (double.tryParse(val) is double && double.parse(val) > 5000) {
      errorCapacity.value = null;
      submitFunc.value = null;
      submitFunc.value = submitFunction();
      fCapacity = true;
    } else {
      errorCapacity.value = 'Debe ser una cantidad mayor a 5000';
      fCapacity = false;
    }
  }

  void validarPlace(String val) {
  errorPlace.value = null;
  submitFunc.value = null;
  if (val.trim().length > 5) {
    // verificacion si ubicación es mayor a 5 caracteres
    submitFunc.value = submitFunction();
  } else {
    errorPlace.value = 'La ubicación debe tener al menos 5 caracteres.';
  }
}

void validarOwner(String val) {
  errorOwner.value = null;
  submitFunc.value = null;
  if (val.trim().length > 3) {
    // el nombre del propietario es mayor a 3 caracteres
    submitFunc.value = submitFunction();
  } else {
    errorOwner.value = 'El nombre del propietario debe tener al menos 3 caracteres.';
  }
}



  void nameChanged(String val) {
    estadioName.value = val;
  }

  void birthdateChanged(String val) {
    estadioDate.value = val;
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

  Future<bool> Function() submitFunction() {
    return () async {
      if (!fName ||!fDate ||!fPlace ||!fOwner ||!fCapacity) {
        submitFunc.value = null;
        validarName(estadioName.value);
        validarDate(estadioDate.value);
        validarPlace(estadioPlace.value);
        validarOwner(estadioOwner.value);
        validarCapacity(estadioCapacity.value);
        return true;
      } else {
        String? mensaje = 'se agregó un nuevo estadio';
        if (_id == '') {
          EstadioModelo estadio = EstadioModelo(
              nombre: estadioName.value,
              fechaFundacion: estadioDate.value,
              ubicacion: estadioPlace.value,
              propietario: estadioOwner.value,
              capacidad: estadioCapacity.value,
              disponible: estadioStatus.value,
          _id = await ctrlst.agregar(estadio);
        } else {
          EstadioModelo estadio = EstadioModelo(
              id: _id,
              nombre: estadioName.value,
              fechaFundacion: estadioDate.value,
              ubicacion: estadioPlace.value,
              propietario: estadioOwner.value,
              capacidad: estadioCapacity.value,
              disponible: estadioStatus.value,
          ctrlst.actualizar(estadio);
          mensaje = 'Se actualizó un estadio';
          Get.offNamed('/listaEstadio');
        }

        if (_id!.isNotEmpty) {
          ctrName.value.text = '';
          ctrDate.value.text = '';
          ctrPlace.value.text = '';
          ctrOwner.value.text = '';
          ctrCapacity.value.text = '';
          estadioStatus.value = true;
          Get.snackbar('Estadio', mensaje);
        }
        return true;
      }
    };
  }


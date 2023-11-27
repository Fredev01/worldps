import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/controller/controller_list.dart';
// import 'package:flutter_application_1/src/models/producto_modelo.dart';
// import 'package:flutter_application_1/src/service/producto_service.dart';
import 'package:get/get.dart';

class ControllerProducto extends GetxController {
  String? _id = '';
  var productName = ''.obs;
  var productCapacity = ''.obs;
  var productAvailable = true.obs;
  bool fName = false;
  bool fCapacity = false;
  RxnString errorName = RxnString(null);
  RxnString errorCapacity = RxnString(null);

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  ProductsService? service;
  ControllerList ctrlst = Get.find();

  var ctrName = TextEditingController().obs;
  var ctrCapacity = TextEditingController().obs;

  void setAttributes(
      String id, String nombre, double capacidad, bool disponible) {
    _id = id;
    ctrName.value.text = nombre;
    ctrCapacity.value.text = capacidad.toString();
    productName.value = nombre;
    productCapacity.value = capacidad.toString();
    productAvailable.value = disponible;
  }

  @override
  void onInit() {
    super.onInit();
    service = ProductsService();

    debounce<String>(productName, validarName,
        time: const Duration(microseconds: 500));
    debounce<String>(productCapacity, validarCapacity,
        time: const Duration(microseconds: 500));
  }

  void validarName(String val) {
    errorName.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorName.value = null;
      submitFunc.value = submitFunction();
      fName = true;
    } else {
      errorName.value = 'El nombre debe ser mayor a 3 digitos';
      fName = false;
    }
  }

  void validarCapacity(String val) {
    errorCapacity.value = null;
    submitFunc.value = null;
    if (double.tryParse(val) is double && double.parse(val) > 10) {
      errorCapacity.value = null;
      submitFunc.value = null;
      submitFunc.value = submitFunction();
      fCapacity = true;
    } else {
      errorCapacity.value = 'Debe ser una cantidad mayor a 10';
      fCapacity = false;
    }
  }

  void nameChanged(String val) {
    productName.value = val;
  }

  void capacityChanged(String val) {
    productCapacity.value = val;
  }

  void availableChanged(bool val) {
    productAvailable.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      if (!fName || !fCapacity) {
        submitFunc.value = null;
        validarName(productName.value);
        validarCapacity(productCapacity.value);
        return true;
      } else {
        String? mensaje = 'se agregó un nuevo estadio';
        if (_id == '') {
          EstadioModelo estadio = EstadioModelo(
              capacidad: double.tryParse(productCapacity.value) ?? 0,
              disponible: productAvailable.value,
              fechaFundacion: DateTime.now(),
              nombre: productName.value,
              propietario: 'Dueño por defecto',
              ubicacion: 'Ubicación por defecto');
          _id = await ctrlst.agregar(estadio);
        } else {
          EstadioModelo estadio = EstadioModelo(
              id: _id,
              capacidad: double.tryParse(productCapacity.value) ?? 0,
              disponible: productAvailable.value,
              fechaFundacion: DateTime.now(),
              nombre: productName.value,
              propietario: 'Dueño por defecto',
              ubicacion: 'Ubicación por defecto');
          ctrlst.actualizar(estadio);
          mensaje = 'Se actualizó un estadio';
          Get.offNamed('/listaEstadio');
        }

        if (_id!.isNotEmpty) {
          ctrName.value.text = '';
          ctrCapacity.value.text = '';
          productAvailable.value = true;
          Get.snackbar('Estadio', mensaje);
        }
        return true;
      }
    };
  }
}

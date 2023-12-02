import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:worldps/src/controller/controller_list_jugador.dart';
import 'package:worldps/src/models/jugador_modelo.dart';
import 'package:worldps/src/service/jugador_service.dart';

class ControllerPlayer extends GetxController {
  String? _id = '';
  var playerName = ''.obs;
  //var playerBirthdate = ''.obs;
  var playerNationality = ''.obs;
  var playerEmail = ''.obs;
  var playerStatus = true.obs;
  var playerLastTeam = ''.obs;
  Rx<DateTime> playerBirthdate = Rx<DateTime>(DateTime(2005));
  bool fName = false;
  //bool fBirthdate = false;
  bool fNationality = false;
  bool fEmail = false;
  bool fLastTeam = false;
  RxnString errorName = RxnString(null);
  RxnString errorBirthdate = RxnString(null);
  RxBool isButtonEnabledRx = false.obs;
  RxnString errorNationality = RxnString(null);
  RxnString errorEmail = RxnString(null);
  RxnString errorLastTeam = RxnString(null);

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  PlayersService? service;
  ControllerListJugador ctrlst = Get.find();
  var ctrName = TextEditingController().obs;
  var ctrBirthdate = TextEditingController().obs;
  var ctrNationality = TextEditingController().obs;
  var ctrEmail = TextEditingController().obs;
  var ctrLastTeam = TextEditingController().obs;

  void setAttributes(String id, String nombre, DateTime fechaNacimiento,
      String nacionalidad, String email, bool status, String ultimoEquipo) {
    _id = id;
    ctrName.value.text = nombre;
    ctrBirthdate.value.text = fechaNacimiento.toString();
    ctrNationality.value.text = nacionalidad;
    ctrEmail.value.text = email;
    ctrLastTeam.value.text = ultimoEquipo;
    playerName.value = nombre;
    playerBirthdate.value = fechaNacimiento;
    playerNationality.value = nacionalidad;
    playerEmail.value = email;
    playerStatus.value = status;
    playerLastTeam.value = ultimoEquipo;
  }

  @override
  void onInit() {
    super.onInit();
    service = PlayersService();
    debounce<String>(playerName, validarName,
        time: const Duration(microseconds: 500));
    debounce<String>(playerNationality, validarNationality,
        time: const Duration(microseconds: 500));
    debounce<String>(playerEmail, validarEmail,
        time: const Duration(microseconds: 500));
    debounce<String>(playerLastTeam, validarLastTeam,
        time: const Duration(microseconds: 500));
  }

  void validarName(String val) {
    errorName.value = null;
    submitFunc.value = null;
    if (val.length <= 15) {
      errorName.value = 'El nombre debe tener al menos 15 caracteres';
      fName = false;
    } else if (RegExp(r'[0-9]').hasMatch(val)) {
      errorName.value = 'El nombre no puede contener números';
      fName = false;
    } else {
      // Si pasa ambas validaciones, establecer fName en true y errorName en null
      fName = true;
      errorName.value = null;
      submitFunc.value = submitFunction();
      print(submitFunc.value);
    }
    updateButtonState();
  }

  void validarNationality(String val) {
    errorNationality.value = null;
    submitFunc.value = null;
    // Verificar que la longitud sea mayor a 15 caracteres
    if (val.length > 4) {
      // Verificar si contiene números usando expresiones regulares
      if (!RegExp(r'[0-9]').hasMatch(val)) {
        // El nombre no contiene números y tiene la longitud correcta
        submitFunc.value = submitFunction();
        fNationality = true;
        errorNationality.value = null;
      } else {
        // El nombre contiene al menos un número
        errorNationality.value = 'El nombre no puede contener números';
        fNationality = false;
      }
    } else {
      // El nombre es demasiado corto
      errorNationality.value = 'El nombre debe ser mayor 4 caracteres';
      fNationality = false;
    }
    updateButtonState();
  }

  void validarEmail(String val) {
    errorEmail.value = null;
    submitFunc.value = null;

    // Expresión regular para validar el formato de correo electrónico
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);

    if (val.length > 7) {
      if (!regExp.hasMatch(val)) {
        errorEmail.value = 'Ingresa un correo electrónico válido';
        fEmail = false;
      } else {
        submitFunc.value = submitFunction();
        fEmail = true;
        errorEmail.value = null;
      }
    } else {
      errorEmail.value = 'El email debe ser mayor 7 caracteres';
      fEmail = false;
    }
    updateButtonState();
  }

  void validarLastTeam(String val) {
    errorLastTeam.value = null;
    submitFunc.value = null;
    // Verificar que la longitud sea mayor a 15 caracteres
    if (val.length > 2) {
      submitFunc.value = submitFunction();
      fLastTeam = true;
      errorLastTeam.value = null;
    } else {
      // El nombre es demasiado corto
      errorLastTeam.value = 'El nombre debe ser mayor 2 caracteres';
      fLastTeam = false;
    }
    updateButtonState();
  }

  void nameChanged(String val) {
    playerName.value = val;
  }

  void birthdateChanged(DateTime val) {
    playerBirthdate.value = val;
    //validarBirthdate(val); // Validar fecha de nacimiento
  }

  void nationalityChanged(String val) {
    playerNationality.value = val;
  }

  void emailChanged(String val) {
    playerEmail.value = val;
  }

  void statusChanged(bool val) {
    playerStatus.value = val;
  }

  void lastTeamChanged(String val) {
    playerLastTeam.value = val;
  }

  void updateButtonState() {
    isButtonEnabledRx.value = fName && fNationality && fEmail && fLastTeam;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      bool isValid = fName && fNationality && fEmail && fLastTeam;

      if (isValid) {
        String? mensaje = 'Se agregó un nuevo jugador';
        String formattedDate =
            '${playerBirthdate.value.day.toString().padLeft(2, '0')}/${playerBirthdate.value.month.toString().padLeft(2, '0')}/${playerBirthdate.value.year.toString()}';
        if (_id == '') {
          JugadorModelo jugador = JugadorModelo(
            nombre: playerName.value,
            fechaNacimiento: formattedDate,
            nacionalidad: playerNationality.value,
            email: playerEmail.value,
            status: playerStatus.value,
            ultimoEquipo: playerLastTeam.value,
          );
          //service?.createPlayer(jugador);
          _id = await ctrlst.agregar(jugador);
        } else {
          JugadorModelo jugador = JugadorModelo(
            id: _id,
            nombre: playerName.value,
            fechaNacimiento: formattedDate,
            nacionalidad: playerNationality.value,
            email: playerEmail.value,
            status: playerStatus.value,
            ultimoEquipo: playerLastTeam.value,
          );
          ctrlst.actualizar(jugador);
          mensaje = 'Se actualizó el jugador';
          Get.offNamed('/listaJugador');
        }

        if (_id!.isNotEmpty) {
          ctrName.value.text = '';
          ctrBirthdate.value.text = '';
          ctrNationality.value.text = '';
          ctrEmail.value.text = '';
          playerStatus.value = true;
          ctrLastTeam.value.text = '';
          Get.snackbar('Jugador', mensaje,
              backgroundColor: const Color.fromARGB(0, 6, 218, 137));
        }
        return true;
      } else {
        submitFunc.value = null;
        validarName(playerName.value);
        validarNationality(playerNationality.value);
        validarEmail(playerEmail.value);
        validarLastTeam(playerLastTeam.value);
        //return false;
      }
      updateButtonState(); // Llama a esta función después de validar los campos
      return isValid;
    };
  }
}

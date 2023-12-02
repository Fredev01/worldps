import 'package:flutter_application_1/src/models/estadio_modelo.dart';
import 'package:flutter_application_1/src/service/estadio_service.dart';
import 'package:get/get.dart';

class ControllerListEstadio extends GetxController {
  var listaEstadio = <EstadioModelo>[].obs;
  StadiumsService service = StadiumsService();

  @override
  void onInit() {
    super.onInit();
    var list = service.loadEstadio();
    list.then((value) => listaEstadio.value = value);
  }

  @override
  void refresh() {
    var list = service.loadEstadio();
    list.then((value) => listaEstadio.value = value);
  }

  void actualizar(EstadioModelo estadio) async {
    await service.updateestadio(estadio);
    int index =
        listaEstadio.value.indexWhere((element) => element.id == estadio.id);
    listaEstadio[index] = estadio;
  }

  void delete(EstadioModelo value) {
    service.deleteestadio(value);
    int index =
        listaEstadio.value.indexWhere((element) => element.id == value.id);
    listaEstadio.removeAt(index);
  }

  Future<String?> agregar(EstadioModelo estadio) async {
    String? id = await service.createEstadio(estadio);
    estadio.id = id;
    listaEstadio.add(estadio);
    return id;
  }
}

import 'package:flutter_application_1/src/models/producto_modelo.dart';
import 'package:flutter_application_1/src/service/producto_service.dart';
import 'package:get/get.dart';

class ControllerList extends GetxController {
  var listaEstadio = <EstadioModelo>[].obs;
  StadiumsService service = StadiumsService();

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
    String? id = await service.createestadio(estadio);
    estadio.id = id;
    listaEstadio.add(estadio);
    return id;
  }
}

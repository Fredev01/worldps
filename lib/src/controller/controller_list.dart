import 'package:flutter_application_1/src/models/producto_modelo.dart';
import 'package:flutter_application_1/src/service/producto_service.dart';
import 'package:get/get.dart';

class ControllerList extends GetxController {
  var listaEstadio = <EstadioModelo>[].obs;
  ProductsService service = ProductsService();

  @override
  void refresh() {
    var list = service.loadProducts();
    list.then((value) => listaEstadio.value = value);
  }

  void actualizar(EstadioModelo estadio) async {
    await service.updateProduct(estadio);
    int index =
        listaEstadio.value.indexWhere((element) => element.id == producto.id);
    listaEstadio[index] = estadio;
  }

  void delete(EstadioModelo value) {
    service.deleteProduct(value);
    int index =
        listaEstadio.value.indexWhere((element) => element.id == value.id);
    listaEstadio.removeAt(index);
  }

  Future<String?> agregar(EstadioModelo estadio) async {
    String? id = await service.createProduct(estadio);
    producto.id = id;
    listaEstadio.add(estadio);
    return id;
  }
}

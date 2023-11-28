import 'package:get/get.dart';
import 'package:worldps/src/models/jugador_modelo.dart';
import 'package:worldps/src/service/jugador_service.dart';

class ControllerListJugador extends GetxController {
  var listaJugador = <JugadorModelo>[].obs;
  PlayersService service = PlayersService();

  @override
  void onInit() {
    super.onInit();
    var list = service.loadPlayers();
    list.then((value) => listaJugador.value = value);
  }

  @override
  void refresh() {
    var list = service.loadPlayers();
    list.then((value) => listaJugador.value = value);
  }

  void actualizar(JugadorModelo jugador) async {
    await service.updatePlayer(jugador);
    int index =
        listaJugador.value.indexWhere((element) => element.id == jugador.id);
    listaJugador[index] = jugador;
  }

  void delete(JugadorModelo value) {
    service.deletePlayer(value);
    int index =
        listaJugador.value.indexWhere((element) => element.id == value.id);
    listaJugador.removeAt(index);
  }

  Future<String?> agregar(JugadorModelo jugador) async {
    String? id = await service.createPlayer(jugador);
    jugador.id = id;
    listaJugador.add(jugador);
    return id;
  }
}

import 'package:flutter_application_1/src/models/jugador_modelo.dart';
import 'package:flutter_application_1/src/service/jugador_service.dart';
import 'package:get/get.dart';

class ControllerListJugador extends GetxController {
  var listaJugador = <JugadorModelo>[].obs;
  PlayersService service = PlayersService();

  @override
  void onInit() {
    super.onInit();
    loadPlayers(); // Llama a la función para cargar los jugadores
  }

  @override
  void refresh() {
    loadPlayers(); // Llama a la función para recargar los jugadores
  }

  Future<void> loadPlayers() async {
    try {
      var players = await service.loadPlayers();
      listaJugador.assignAll(players);
    } catch (e) {
      print('Error al cargar jugadores: $e');
    }
  }

  void actualizar(JugadorModelo jugador) async {
    await service.updatePlayer(jugador);
    int index = listaJugador.indexWhere((element) => element.id == jugador.id);
    listaJugador[index] = jugador;
  }

  void delete(JugadorModelo value) {
    service.deletePlayer(value);
    int index = listaJugador.indexWhere((element) => element.id == value.id);
    listaJugador.removeAt(index);
  }

  Future<String?> agregar(JugadorModelo jugador) async {
    String? id = await service.createPlayer(jugador);
    jugador.id = id;
    listaJugador.add(jugador);
    return id;
  }
}

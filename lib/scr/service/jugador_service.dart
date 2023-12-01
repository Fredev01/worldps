import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/scr/models/jugador_modelo.dart';
import 'package:http/http.dart' as http;

class PlayersService extends ChangeNotifier {
  final String _baseUrl = 'worldps-faba3-default-rtdb.firebaseio.com';
  final List<JugadorModelo> players = [];

  Future<String?> createPlayer(JugadorModelo player) async {
    final url = Uri.https(_baseUrl, 'jugadores.json');
    final resp = await http.post(url, body: json.encode(player));
    final decodedData = json.decode(resp.body);

    player.id = decodedData['name'];
    return player.id;
  }

  // leer los datos de firebase
  Future<List<JugadorModelo>> loadPlayers() async {
    final List<JugadorModelo> players = [];
    final url = Uri.https(_baseUrl, 'jugadores.json');

    final resp = await http.get(url);

    final Map<String, dynamic> playersMap = json.decode(resp.body);
    playersMap.forEach((key, value) {
      final tempPlayer = JugadorModelo.fromJson(value);
      tempPlayer.id = key;
      players.add(tempPlayer);
    });
    return players;
  }

  Future<bool> deletePlayer(JugadorModelo value) async {
    final url = Uri.https(_baseUrl, 'jugadores/${value.id}.json');
    final resp = await http.delete(url);
    return resp.statusCode == 200;
  }

  Future<String?> updatePlayer(JugadorModelo player) async {
    final url = Uri.https(_baseUrl, 'jugadores/${player.id}.json');
    await http.put(url, body: json.encode(player));
    return player.id;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/estadio_modelo.dart';
import 'package:http/http.dart' as http;

class StadiumsService extends ChangeNotifier {
  final String _baseUrl = 'worldps-faba3-default-rtdb.firebaseio.com';
  final List<EstadioModelo> estadio = [];

  Future<String?> createestadio(EstadioModelo estadio) async {
    final url = Uri.https(_baseUrl, 'estadio.json');
    final resp = await http.post(url, body: json.encode(estadio));
    final decodedData = json.decode(resp.body);

    estadio.id = decodedData['name'];
    return estadio.id;
  }

  // leer los datos de firebase
  Future<List<EstadioModelo>> loadEstadio() async {
    final List<EstadioModelo> estadio = [];
    final url = Uri.https(_baseUrl, 'estadio.json');
    final resp = await http.get(url);

    final Map<String, dynamic> estadioMap = json.decode(resp.body);

    estadioMap.forEach((key, value) {
      final tempEstadio = EstadioModelo.fromJson(value);
      tempEstadio.id = key;
      estadio.add(tempEstadio);
    });
    return estadio;
  }

  Future<bool> deleteestadio(EstadioModelo value) async {
    final url = Uri.https(_baseUrl, 'estadio/${value.id}.json');
    final resp = await http.delete(url);
    return resp.statusCode == 200;
  }

  Future<String?> updateestadio(EstadioModelo estadio) async {
    final url = Uri.https(_baseUrl, 'estadio/${estadio.id}.json');
    await http.put(url, body: json.encode(estadio));
    return estadio.id;
  }
}

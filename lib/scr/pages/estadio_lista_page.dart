import 'package:flutter/material.dart';
import 'package:worldps/scr/custom_widget/drawer_item.dart';
// import 'package:worldps/scr/pages/estadio_page.dart';

class EstadioListaPage extends StatelessWidget {
  const EstadioListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de estadios'),
      ),
      floatingActionButton: const AddEstadio(),
    );
  }
}

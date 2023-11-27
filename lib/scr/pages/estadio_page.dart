import 'package:flutter/material.dart';

class EstadioPage extends StatefulWidget {
  const EstadioPage({Key? key}) : super(key: key);

  @override
  _EstadioPageState createState() => _EstadioPageState();
}

class _EstadioPageState extends State<EstadioPage> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2023),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Estadio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                onChanged: null,
                decoration: const InputDecoration(
                  labelText: 'Nombre del estadio',
                ),
              ),
              TextFormField(
                onChanged: null,
                onTap: () => _selectDate(context),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : '',
                ),
                decoration: const InputDecoration(
                  labelText: 'Fecha de construcción',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              TextFormField(
                onChanged: null,
                decoration: const InputDecoration(
                  labelText: 'Ubicación',
                ),
              ),
              TextFormField(
                onChanged: null,
                decoration: const InputDecoration(
                  labelText: 'Dueño',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: null,
                decoration: const InputDecoration(
                  labelText: 'Capacidad del estadio',
                ),
              ),
              SwitchListTile(
                  value: true,
                  title: const Text('Activo/En mantenimiento'),
                  onChanged: (value) => print('Cambio de valor')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}

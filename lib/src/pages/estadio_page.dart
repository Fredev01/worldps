import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_estadio.dart';
import 'package:get/get.dart';
// import 'package:worldps/scr/custom_widget/drawer_item.dart';

class EstadioPage extends StatelessWidget {
  const EstadioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(ControllerEstadio());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Estadio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  onChanged: fx.nameChanged,
                  controller: fx.ctrName.value,
                  decoration: InputDecoration(
                      labelText: 'Nombre del estadio',
                      errorText: fx.errorName.value),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  readOnly: true,
                  controller: fx.ctrDate.value,
                  onTap: () {
                    _selectDate(context, fx);
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  decoration: InputDecoration(
                    labelText: 'Fecha de construcción',
                    errorText: fx.errorDate.value,
                    filled: true,
                    prefixIcon: const Icon(Icons.calendar_today),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrPlace.value,
                  onChanged: fx.placeChanged,
                  decoration: InputDecoration(
                      labelText: 'Ubicación', errorText: fx.errorPlace.value),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  controller: fx.ctrOwner.value,
                  onChanged: fx.ownerChanged,
                  decoration: InputDecoration(
                    labelText: 'Dueño',
                    errorText: fx.errorOwner.value,
                  ),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  controller: fx.ctrCapacity.value,
                  onChanged: fx.capacityChanged,
                  decoration: InputDecoration(
                    labelText: 'Capacidad del estadio',
                    errorText: fx.errorCapacity.value,
                  ),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return SwitchListTile(
                    value: fx.estadioStatus.value,
                    onChanged: fx.statusChanged,
                    title: const Text('Mantenimiento'));
              }),
              const SizedBox(height: 10),
              Obx(() {
                return ElevatedButton.icon(
                    onPressed:
                        fx.isButtonEnabledRx.value ? fx.submitFunc.value : null,
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, ControllerEstadio controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.estadioDate.value,
      firstDate: DateTime(1854),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != controller.estadioDate.value) {
      controller.estadioDate(picked);
      final formattedDate =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString()}';
      controller.ctrDate.value.text = formattedDate;
    }
  }
}
// @override
//   _EstadioPageState createState() => _EstadioPageState();
// }

// class _EstadioPageState extends State<EstadioPage> {
//   DateTime? _selectedDate;

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1854),
//       lastDate: DateTime.now(),
//     );

//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }
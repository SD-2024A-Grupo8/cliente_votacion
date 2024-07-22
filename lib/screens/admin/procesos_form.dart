import 'package:cliente_votacion/client_services/serv_procesos.dart';
import 'package:cliente_votacion/providers/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcesoForm extends ConsumerStatefulWidget {
  BuildContext fatherContext;

  ProcesoForm({super.key, required this.fatherContext});

  @override
  ProcesoFormState createState() => ProcesoFormState();
}

class ProcesoFormState extends ConsumerState<ProcesoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _especialidadController = TextEditingController();
  final _cargoController = TextEditingController();

  @override
  void dispose() {
    _nombresController.dispose();
    _apellidosController.dispose();
    _especialidadController.dispose();
    _cargoController.dispose();
    super.dispose();
  }

  void _submitForm(ProcesoNotifier procesoNotifier) {
    if (_formKey.currentState!.validate()) {
      final nombres = _nombresController.text;
      final apellidos = _apellidosController.text;
      final especialidad = _especialidadController.text;
      final cargo = _cargoController.text;

      //Proceso newProceso = Proceso(nombres: nombres, apellidos: apellidos, especialidad: especialidad, cargo: cargo);

      //procesoNotifier.createProcesos(newProceso);

      Navigator.of(widget.fatherContext).pop();
    }
    
  }

  void closeForm() {
    Navigator.of(widget.fatherContext).pop();
  }

  @override
  Widget build(BuildContext context) {

    final procesosNotifier = ref.read(procesosProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nombresController,
              decoration: const InputDecoration(
                labelText: 'Nombres',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el nombre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _apellidosController,
              decoration: const InputDecoration(
                labelText: 'apellidos',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese la descripción';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _especialidadController,
              decoration: const InputDecoration(
                labelText: 'especialidad',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el teléfono';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cargoController,
              decoration: const InputDecoration(
                labelText: 'cargo',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese el fax';
                }
                return null;
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: closeForm,
                    child: const Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm(procesosNotifier);
                    },
                    child: const Text('Guardar'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
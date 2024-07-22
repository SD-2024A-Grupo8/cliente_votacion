import 'package:cliente_votacion/screens/admin/procesos_form.dart';
import 'package:flutter/material.dart';

class AgregarProceso extends StatelessWidget {
  const AgregarProceso({super.key});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Formualrio - Nuevo proceso'),
              content: ProcesoForm(fatherContext :context)
            );
          },
        );
      },
      child: const Text('Agregar Ingeniero'),
    );
  }
}
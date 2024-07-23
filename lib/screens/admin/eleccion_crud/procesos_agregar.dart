import 'package:cliente_votacion/screens/admin/eleccion_crud/procesos_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgregarProceso extends StatelessWidget {
  const AgregarProceso({super.key});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            String startDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 4)));
            String endDate = DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 4)));
            String rangoFechas = "${startDate.toString()} - ${endDate.toString()}";

            return AlertDialog(
              title: const Text('Formualrio - Nuevo proceso'),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {

                  void callbackFecha(value){
                    setState(() {
                      rangoFechas = value;
                    });
                  }
                  return ProcesoForm(fatherContext: context, callback: callbackFecha, rangoFechas: rangoFechas);
                },
              )
            );
          },
        );
      },
      child: const Text('Agregar Elección'),
    );
  }
}
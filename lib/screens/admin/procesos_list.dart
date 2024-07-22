import 'package:cliente_votacion/models/proceso.dart';
import 'package:cliente_votacion/providers/states.dart';
import 'package:cliente_votacion/screens/admin/procesos_agregar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcesosAdminList extends ConsumerWidget {
  const ProcesosAdminList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final procesos = ref.watch(procesosProvider);
    // final procesosNotifier = ref.read(procesosProvider.notifier);

    //
    List<Proceso> procesos = [];
    Proceso pro1 = Proceso(id: 1, nameEleccion: "proceso111",description: "Este pro.... 111", candidatosId: [1, 2]);
    Proceso pro2 = Proceso(id: 2, nameEleccion: "proceso222",description: "Este pro.... 222", candidatosId: [3, 4]);
    Proceso pro3 = Proceso(id: 3, nameEleccion: "proceso333",description: "Este pro.... 333", candidatosId: [5, 6]);
    procesos.add(pro1);
    procesos.add(pro2);
    procesos.add(pro3);
    //

    return Column(
      children: [
        Expanded(
          child: procesos.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Número de columnas en la cuadrícula
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: procesos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    procesos[index].nameEleccion,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    procesos[index].description,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 50), // Espacio para los botones flotantes
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              right: 8.0,
                              child: FloatingActionButton(
                                onPressed: () {
                                  // Acción del botón de edición
                                },
                                mini: true,
                                child: const Icon(Icons.edit),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              right: 72.0,
                              child: FloatingActionButton(
                                onPressed: () {
                                  //procesosNotifier.deleteProceso(procesos[index].id);
                                },
                                mini: true,
                                child: const Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(10.0),
                ),
        ),
        const AgregarProceso(),
      ],
    );
  }
}
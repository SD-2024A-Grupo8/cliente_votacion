import 'package:cliente_votacion/providers/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcesosList extends ConsumerWidget {
  const ProcesosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final procesos = ref.watch(procesosProvider);
    // final procesosNotifier = ref.read(procesosProvider.notifier);

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
                    child: Center(
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
                              const SizedBox(height: 50),
                            ],
                          ),
                        )
                  ),
                );
              },
              padding: const EdgeInsets.all(10.0),
            )
        )
      ],
    );
  }
}
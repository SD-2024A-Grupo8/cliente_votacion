import 'package:cliente_votacion/models/candidato.dart';
import 'package:cliente_votacion/widgets/admin_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDashboard extends ConsumerStatefulWidget {
  const MyDashboard({ super.key });

  @override
  MyDashboardState createState() => MyDashboardState();
}

class MyDashboardState extends ConsumerState<MyDashboard> {
  List<Candidato> candidatos = [];

  @override
  void initState() {
    super.initState();
    // Inicializar los candidatos en initState
    Candidato can1 = Candidato(id: 1, nombre: "Candidato A");
    Candidato can2 = Candidato(id: 2, nombre: "Candidato B");
    Candidato can3 = Candidato(id: 3, nombre: "Candidato C");
    candidatos.addAll([can1, can2, can3]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: candidatos.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: candidatos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amber,
                  child: AdminCircularChart(title: "Elecciones 00$index")
                   
                );
              },
              padding: const EdgeInsets.all(10.0),
            )
        )
      ],
    );
  }
}
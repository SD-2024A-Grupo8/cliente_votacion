import 'package:cliente_votacion/models/candidato.dart';
import 'package:cliente_votacion/providers/states.dart';
import 'package:cliente_votacion/screens/votante/voto_confirmar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class CandidatosList extends ConsumerStatefulWidget {
  final String procesoId;
  const CandidatosList({super.key, required this.procesoId});

  @override
  CandidatosListState createState() => CandidatosListState();
}

class CandidatosListState extends ConsumerState<CandidatosList> {

  @override
  Widget build(BuildContext context) {
    // final candidatos = ref.watch(candidatosProvider);

    //
    final candidatoSel = ref.watch(candidatoSeleccionado);

    List<Candidato> candidatos = [];
    Candidato can1 = Candidato(id: 1, nombre: "Candidato A");
    Candidato can2 = Candidato(id: 2, nombre: "Candidato B");
    Candidato can3 = Candidato(id: 3, nombre: "Candidato C");
    candidatos.add(can1);
    candidatos.add(can2);
    candidatos.add(can3);
    //

    return Column(
      children: [
        Expanded(
          child: candidatos.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: candidatos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: (index==candidatoSel) ? Colors.amber : Colors.white,
                  child: InkWell(
                  onTap: (){
                    print('Card ${candidatos[index].nombre} tapped');
                    print('Proceso id: ${widget.procesoId}');
                    print('befores $index');
                    ref.read(candidatoSeleccionado.notifier).update((state) => index);
                    print('after $candidatoSel');
                  },
                  splashColor: Colors.amber,
                  highlightColor: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              candidatos[index].nombre,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    )
                  )
                );
              },
              padding: const EdgeInsets.all(10.0),
            )
        ),
        VotoConfirmar(seHaMarcado: (candidatoSel!=100))
      ],
    );
  }
}
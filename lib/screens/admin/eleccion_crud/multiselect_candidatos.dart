import 'package:cliente_votacion/models/candidato.dart';
import 'package:cliente_votacion/providers/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiselectCandidatos extends ConsumerStatefulWidget {
  final Function callback;
  const MultiselectCandidatos({super.key, required this.callback});

  @override
  MultiselectCandidatosState createState() => MultiselectCandidatosState();
}

class MultiselectCandidatosState extends ConsumerState<MultiselectCandidatos> {

  @override
  Widget build(BuildContext context) {

    final candidatos = ref.watch(candidatosProvider);

    final candList = candidatos.map((cand) => MultiSelectItem<Candidato>(cand, cand.nombre)).toList();

    return Container(
      width: 400,
      child: Column(
        children: <Widget>[
          MultiSelectDialogField(
            items: candList,
            title: const Text("Lista de candidatos"),
            itemsTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            selectedItemsTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            selectedColor: Colors.black,            
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            buttonIcon: const Icon(
              Icons.flag,
            ),
            buttonText: const Text(
              "Ver la lista de candidatos",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onConfirm: (results) {
              print("resultados");
              List<int?> ids = results.map((cand) => cand.id).toList();
              ref.read(candidatosIds.notifier).update((state) => ids);
            },
          ),
        ],
      ),
    );
  }
}

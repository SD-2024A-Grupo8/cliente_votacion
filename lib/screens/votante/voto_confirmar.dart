import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class VotoConfirmar extends StatelessWidget {
  bool seHaMarcado;
  VotoConfirmar({super.key, required this.seHaMarcado});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(width: 1.0),
              ),
            ),
          ),
          onPressed: seHaMarcado? () {
            showDialogg(context);
          }:null,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Enviar voto',
              style: TextStyle(
                fontSize: 20,
                color: seHaMarcado? Colors.black: Colors.black12
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showDialogg(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmar elección de voto?'),
        content: const Text("Proyecto"),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            onPressed: () {
              print('Custom button pressed');
              context.go('/votante');
            },
            child: const Text('Sí'),
          ),
        ]
      );
    },
  );
}
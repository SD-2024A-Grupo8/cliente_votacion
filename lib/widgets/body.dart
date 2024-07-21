import 'package:cliente_votacion/screens/votante/procesos_list.dart';
import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  const MyBody({ super.key });

  @override
  Widget build(BuildContext context){
    return const SizedBox(
      width: 600,
      child: ProcesosList(),
    );
  }
}
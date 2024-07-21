import 'package:cliente_votacion/screens/votante/procesos_list.dart';
import 'package:cliente_votacion/widgets/layout.dart';
import 'package:flutter/material.dart';

class VotantePrincipal extends StatefulWidget {
  const VotantePrincipal({ super.key });

  @override
  VotantePrincipalState createState() => VotantePrincipalState();
}

class VotantePrincipalState extends State<VotantePrincipal> {
  @override
  Widget build(BuildContext context) {
    return const CustomLayout(
      title: "Lista de elecciones disponibles",
      child: ProcesosList()
    );
  }
}
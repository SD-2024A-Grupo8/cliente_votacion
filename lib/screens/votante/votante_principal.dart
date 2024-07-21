import 'package:cliente_votacion/widgets/appbar.dart';
import 'package:cliente_votacion/widgets/body.dart';
import 'package:cliente_votacion/widgets/drawer.dart';
import 'package:flutter/material.dart';

class VotantePrincipal extends StatefulWidget {
  const VotantePrincipal({ super.key });

  @override
  VotantePrincipalState createState() => VotantePrincipalState();
}

class VotantePrincipalState extends State<VotantePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Row(
        children: [
          MyDrawer(),
          const MyBody(),
        ],
      ),
    );
  }
}
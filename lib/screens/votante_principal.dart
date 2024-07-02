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
      appBar: AppBar(title: const Text('Votante Principal')),
      body: const Center(child: Text('Votante Principal Page')),
    );
  }
}
import 'package:cliente_votacion/providers/states.dart';
import 'package:cliente_votacion/styles/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ignore: non_constant_identifier_names
Container MyDrawer (BuildContext context){
  return Container(
    margin: const EdgeInsets.only(left: 15, top: 15),
    width: 220,
    decoration: boxDecorationContainer(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Image.asset("assets/images/usuario.png"),
        ),
        const BuildMenuItem(index: 0, icon: Icons.home, title: 'Principal', route: "/votante"),
        const BuildMenuItem(index: 1, icon: Icons.home, title: 'Mis votaciones', route: "/"),
        const BuildMenuItem(index: 2, icon: Icons.home, title: 'Mis datos', route: "/"),
        const BuildMenuItem(index: 3, icon: Icons.logout, title: 'Salir', route: "/"),
      ],
    ),
  );
}

class BuildMenuItem extends ConsumerWidget {
  
  final int index;
  final IconData icon;
  final String title;
  final String route; 
  const BuildMenuItem({ super.key, required this.index, required this.icon, required this.title, required this.route});

  @override
  Widget build(BuildContext context, WidgetRef ref){

    final selected = ref.watch(menuVotanteItemSelected);

    return Container(
      decoration: BoxDecoration(
        color: (selected == index)? Colors.amber: Colors.white,
        border: const Border(
          bottom: BorderSide(color: Colors.black26, width: 1.0)
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        onTap: () {
          ref.read(menuAdminItemSelected.notifier).update((state) =>index);
          context.go(route);
        },
      ),
    );
  }
}
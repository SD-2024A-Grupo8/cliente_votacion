import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: non_constant_identifier_names
Container MyAdminDrawer (BuildContext context){
  return Container(
    margin: const EdgeInsets.only(left: 15),
    width: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/usuario.png"),
        
        buildMenuItem(Icons.home, 'Principal', () {
           context.go("/admin");
        }),
        buildMenuItem(Icons.format_list_bulleted_outlined, 'Lista de procesos', () {
          context.go("/admin/lista_procesos");
        }),
        buildMenuItem(Icons.plus_one, 'Nuevo proceso', () {
          context.go("/admin/agregar_proceso");
        }),
        buildMenuItem(Icons.auto_graph, 'Reportes', () {
          // Acción para la página de contacto
        }),
        buildMenuItem(Icons.contact_mail, 'Salir', () {
          // Acción para la página de contacto
        })
      ],
    ),
  );
}

Widget buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26, width: .0),
          right: BorderSide(color: Colors.black26, width: 2.0),
          left: BorderSide(color: Colors.black26, width: 1.0),
          top: BorderSide(color: Colors.black26, width: 1.0)
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        onTap: onTap,
      ),
    );
  }
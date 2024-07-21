import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SizedBox MyAdminDrawer (){
  return SizedBox(
    width: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/usuario.png"),
        
        buildMenuItem(Icons.home, 'Principal', () {
          // Acción para la página de inicio
        }),
        buildMenuItem(Icons.format_list_bulleted_outlined, 'Lista de procesos', () {
          // Acción para la página de características
        }),
        buildMenuItem(Icons.plus_one, 'Nuevo proceso', () {
          // Acción para la página de precios
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
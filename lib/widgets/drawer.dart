import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SizedBox MyDrawer (){
  return SizedBox(
    width: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildMenuItem(Icons.home, 'Principal', () {
          // Acción para la página de inicio
        }),
        buildMenuItem(Icons.featured_play_list, 'Mis votaciones', () {
          // Acción para la página de características
        }),
        buildMenuItem(Icons.attach_money, 'Mis datos', () {
          // Acción para la página de precios
        }),
        buildMenuItem(Icons.contact_mail, 'Salir', () {
          // Acción para la página de contacto
        }),
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
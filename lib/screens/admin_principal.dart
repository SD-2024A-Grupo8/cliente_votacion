import 'package:flutter/material.dart';

class AdminPrincipal extends StatefulWidget {
  const AdminPrincipal({ super.key });

  @override
  AdminPrincipalState createState() => AdminPrincipalState();
}

class AdminPrincipalState extends State<AdminPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Principal')),
      body: const Center(child: Text('Admin Principal Page')),
    );
  }
}
import 'package:cliente_votacion/screens/admin/dashboard.dart';
import 'package:cliente_votacion/widgets/admin_layout.dart';
import 'package:flutter/material.dart';

class AdminPrincipal extends StatefulWidget {
  const AdminPrincipal({ super.key });

  @override
  AdminPrincipalState createState() => AdminPrincipalState();
}

class AdminPrincipalState extends State<AdminPrincipal> {
  @override
  Widget build(BuildContext context) {
    return const CustomAdminLayout(
      title: "Dashboard",
      child: MyDashboard()
    );
  }
}
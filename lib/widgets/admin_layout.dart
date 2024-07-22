import 'package:flutter/material.dart';
import 'package:cliente_votacion/styles/general.dart';
import 'package:cliente_votacion/widgets/admin_drawer.dart';
import 'package:cliente_votacion/widgets/admin_appbar.dart';

class CustomAdminLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const CustomAdminLayout({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAdminAppBar(),
      body: Row(
        children: [
          Expanded(flex: 0, child: MyAdminDrawer(context)),
          Expanded(
            flex: 1, 
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.only(right: 30, left: 20, top: 15, bottom: 15),
              decoration: boxDecorationContainer(),
              child: Column(
                children: [
                  Expanded(
                    flex: 0, 
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        title,
                        style: titleStyle(),
                      ),
                    )
                  ),
                  Expanded(flex:1, child: child)
                ],
              ),
            )
          )
        ],
      )
    ); 
  }
}
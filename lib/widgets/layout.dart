import 'package:cliente_votacion/styles/general.dart';
import 'package:cliente_votacion/widgets/appbar.dart';
import 'package:cliente_votacion/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const CustomLayout({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Row(
        children: [
          Expanded(flex: 0, child: MyDrawer(context)),
          Expanded(
            flex: 1, 
            child: Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              margin: const EdgeInsets.only(right: 30, left: 20, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3)
                  ),
                ],
              ),
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
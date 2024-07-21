import 'package:cliente_votacion/styles/general.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({ super.key });

  @override
  Widget build(BuildContext context){

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nombre de usuario",
              style: generalStyle(),
            ),
            Expanded(child: _navBarItems())
          ],
        ),
      )
    );
  }


  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: navBarStyle(),
                  ),
                ),
              ),
            )
            .toList(),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final List<String> _menuItems = <String>[
  'Nosotros',
  'Contactanos',
  'Salir',
];
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
const Login({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido al sistema de votaciones')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/votante'),
              child: const Text('Página de votante'),
            ),
            const SizedBox( height: 20,),
            ElevatedButton(
              onPressed: () => context.go('/admin'),
              child: const Text('Página de admin'),
            ),
          ]
        )
      ),
    );
  }
}
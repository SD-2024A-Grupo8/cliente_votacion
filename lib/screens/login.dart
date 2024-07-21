import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido al sistema de votaciones')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/votacion04.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10), 
                    child: Text(
                    "Votaciones 2024",
                    style: TextStyle(fontSize: 40),  
                  )
                )
              ),
              Card(
                child: SizedBox(
                  width: 1000,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 30, right: 15),
                          child: Center(
                            child: Image.asset("assets/images/votacion02.webp")
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 15, right: 30),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Dni o email',
                                  hintText: 'Ingrese un correo válido abc@gmail.com'
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 15, right: 30),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Contraseña',
                                  hintText: 'Ingrese una contraseña segura'
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 65,
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: ElevatedButton(
                                  child: const Text(
                                    'Ingresar',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    //context.go('/votante')
                                    context.go('/admin');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 15, left: 60),
                                    child: Text('¿Olvidó su contraseña? '),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1.0, bottom: 15),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        'Obtener ayuda para ingresar.',
                                        style: TextStyle(fontSize: 14, color: Colors.blue),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      )    
                    ],
                  )
                ),
              )
            ]
          )
        ),
      )
    );
  }
}

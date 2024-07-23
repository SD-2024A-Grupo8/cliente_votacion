import 'package:cliente_votacion/screens/admin/admin_principal.dart';
import 'package:cliente_votacion/screens/admin/eleccion_crud/procesos_list.dart';
import 'package:cliente_votacion/screens/login.dart';
import 'package:cliente_votacion/screens/votante/candidatos_list.dart';
import 'package:cliente_votacion/screens/votante/votante_principal.dart';
import 'package:cliente_votacion/widgets/admin_layout.dart';
import 'package:cliente_votacion/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/votante',
      builder: (BuildContext context, GoRouterState state) {
        return const VotantePrincipal();
      },
      routes: <GoRoute>[
        GoRoute(
          path: 'candidatos/:proceso_id',
          builder: (BuildContext context, GoRouterState state) {
            final procesoId = state.pathParameters['proceso_id']??'0';
            return CustomLayout(
              title: "Elija a su candidato",
              child: CandidatosList(procesoId: procesoId)
            );
          },
        )
      ]
    ),
    GoRoute(
      path: '/admin',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminPrincipal();
      },
      routes: <GoRoute>[
        GoRoute(
          path: 'lista_procesos',
          builder: (BuildContext context, GoRouterState state) {
            return const CustomAdminLayout(
              title: "Lista de procesos",
              child: ProcesosAdminList()
            );
          },
        ),
        GoRoute(
          path: 'agregar_proceso',
          builder: (BuildContext context, GoRouterState state) {
            return const CustomAdminLayout(
              title: "Registro de nuevo proceso",
              child: ProcesosAdminList()
            );
          },
        )
      ]
    ),
  ],
);
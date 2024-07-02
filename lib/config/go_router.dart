import 'package:cliente_votacion/screens/admin_principal.dart';
import 'package:cliente_votacion/screens/login.dart';
import 'package:cliente_votacion/screens/votante_principal.dart';
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
    ),
    GoRoute(
      path: '/admin',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminPrincipal();
      },
    ),
  ],
);
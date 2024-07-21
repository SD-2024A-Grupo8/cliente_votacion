import 'package:cliente_votacion/client_services/serv_procesos.dart';
import 'package:cliente_votacion/models/proceso.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliente_votacion/models/usuario.dart';
import 'package:cliente_votacion/client_services/serv_auth.dart';

final usuarioLogeadoProvider = StateNotifierProvider<UsuarioNotifier, Usuario?>((ref) {
  return UsuarioNotifier();
});

final procesosProvider = StateNotifierProvider<ProcesoNotifier, List<Proceso>>((ref) {
  return ProcesoNotifier();
});
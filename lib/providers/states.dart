import 'package:cliente_votacion/client_services/serv_candidatos.dart';
import 'package:cliente_votacion/client_services/serv_procesos.dart';
import 'package:cliente_votacion/models/candidato.dart';
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

final candidatosProvider = StateNotifierProvider<CandidatoNotifier, List<Candidato>>((ref) {
  return CandidatoNotifier();
});

final candidatoSeleccionado = StateProvider.autoDispose<int>((ref) => 100);
final menuVotanteItemSelected = StateProvider<int>((ref) => 0);
final menuAdminItemSelected = StateProvider<int>((ref) => 0);
final candidatosIds = StateProvider<List<int?>>((ref) => []);
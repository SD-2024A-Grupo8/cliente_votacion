import 'package:cliente_votacion/client_services/serv_procesos.dart';
import 'package:cliente_votacion/models/proceso.dart';
import 'package:cliente_votacion/providers/states.dart';
import 'package:cliente_votacion/screens/admin/eleccion_crud/multiselect_candidatos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class ProcesoForm extends ConsumerStatefulWidget {
  BuildContext fatherContext;
  Function callback;
  String rangoFechas;

  ProcesoForm({super.key, required this.fatherContext, required this.callback, required this.rangoFechas});

  @override
  ProcesoFormState createState() => ProcesoFormState();
}

class ProcesoFormState extends ConsumerState<ProcesoForm> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final decripcionController = TextEditingController();
  List<int> candiatosIds = <int>[];

  DateTime startDate = DateTime.now().subtract(const Duration(days: 4));
  String startDateFormat = "";
  DateTime endDate = DateTime.now().add(const Duration(days: 4));
  String endDateFormat = "";
  String rangeString = "";

  void callbackCandidatosIds(List<int> ids){
    print(ids);
    setState(() {
      candiatosIds = ids;
    });
  }

  @override
  void dispose() {
    nombreController.dispose();
    decripcionController.dispose();
    super.dispose();
  }

  void submitForm(ProcesoNotifier procesoNotifier, List<int?> ids) {
    if (_formKey.currentState!.validate()) {
      final nombre = nombreController.text;
      final descripcion = decripcionController.text;


      print(nombre);
      print(descripcion);
      print(startDateFormat);
      print(endDateFormat);
      print(ids);

      Proceso newProceso = Proceso(
        nameEleccion: nombre, 
        description: descripcion, 
        fechaInicio: startDateFormat, 
        fechaFin: endDateFormat,
        candidatosId: ids
      );
      procesoNotifier.createProceso(newProceso);
      Navigator.of(widget.fatherContext).pop();
    }
  }

  void closeForm() {
    Navigator.of(widget.fatherContext).pop();
  }

  @override
  void initState() {
    super.initState();
    startDateFormat = DateFormat('yyyy-MM-dd').format(startDate);
    endDateFormat = DateFormat('yyyy-MM-dd').format(endDate);
    rangeString = "Del $startDateFormat al $startDateFormat";
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        startDateFormat = DateFormat('yyyy-MM-dd').format(args.value.startDate);
        endDateFormat = DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate);
        rangeString = "$startDateFormat - $endDateFormat";
        widget.callback(rangeString);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final procesosNotifier = ref.read(procesosProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: decripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la descripción';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(title: Text("Rango de fechas :  ${widget.rangoFechas}")),
            Row(
              children: [
                const Text("Rango de fechas:", style: TextStyle(color: Colors.white), ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: SfDateRangePicker(
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                      startDate,
                      endDate
                    )
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                MultiselectCandidatos(callback: callbackCandidatosIds)
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: closeForm,
                    child: const Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      submitForm(procesosNotifier, ref.watch(candidatosIds));
                    },
                    child: const Text('Guardar'),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
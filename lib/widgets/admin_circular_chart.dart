import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class AdminCircularChart extends StatelessWidget {
  final String title;

  AdminCircularChart({ super.key , required this.title});

  List<PieData> pieData = [
    PieData('Candidato1', 88, "72"),
    PieData('Candidato2', 35, "35"),
    PieData('Candidato3', 15, "25"),
    PieData('Candidato4', 40, "40"),
  ];

  @override
  Widget build(BuildContext context){
    return SfCircularChart(
      title: ChartTitle(text: title),
      legend: const Legend(isVisible: true),
      series: <PieSeries<PieData, String>>[
          PieSeries<PieData, String>(
          explode: true,
          explodeIndex: 1,
          dataSource: pieData,
          xValueMapper: (PieData data, _) => data.xData,
          yValueMapper: (PieData data, _) => data.yData,
          dataLabelMapper: (PieData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true)
        ),
      ]
    );
  }
}

class PieData {
 PieData(this.xData, this.yData, [this.text]);
 final String xData;
 final num yData;
 String? text;
}
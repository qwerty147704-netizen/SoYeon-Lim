
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'developer_data.dart';

class Pie extends StatefulWidget {
  final List<DeveloperData> data;
  const Pie({super.key, required this.data});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCircularChart(
            title: ChartTitle(
              text: 'Yeary Growth In The Flutter Community'
            ),
            tooltipBehavior: tooltipBehavior,
            series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(
                name: 'Sites 수',
                dataSource: widget.data,
                explode: true, // 클릭시 효과
                selectionBehavior: SelectionBehavior(enable: true), // 클릭시 강조
                xValueMapper: (DeveloperData developers, _) => developers.year,
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
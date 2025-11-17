
import 'package:flutter/material.dart';
import 'package:gittest_app/developer_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Scatter extends StatefulWidget {
   final List<DeveloperData> data;
  const Scatter({super.key,required this.data});

  @override
  State<Scatter> createState() => _ScatterState();
}

class _ScatterState extends State<Scatter> {
 late List<DeveloperData> data;
late TooltipBehavior tooltipBehavior;

@override
  void initState() {
    super.initState();
  data=[];
  tooltipBehavior =TooltipBehavior(enable: true); //도움말
 
  
  
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scatter chart'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SizedBox(//size박스로 두른다
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'yearly in the Flutter community\n\n'//차트 위 제목  \n\n떨어뜨리기 
            ),
            tooltipBehavior: tooltipBehavior,//클릭할때 나오게하는거
            //legend: Legend(isVisible: true), //범례를 쓰려면 name값을 넣어줘야한다 
            
            series: [
              //Scatterseries x축과 y축 의 관계를 볼때 쓰는 그래프 
              //LineSeries :추세와 경향을볼때 쓰는 그래프
              //ColumnSeries :세로축 막대그래프
              //barSeries :가로축 막대 그래프
              ScatterSeries<DeveloperData,int>(//타입을 <>으로 
                name: 'Site 수',//눌렀을때 툴팁에 나오는 이름
                dataSource: widget.data,//리스트 불러오기
                xValueMapper: (DeveloperData developers,_) => developers.year ,//x축 
               yValueMapper: (DeveloperData developers, _) => developers.developers,//y축 
               dataLabelSettings: DataLabelSettings(isVisible: true),//막대기 위에 숫자 표시
               enableTooltip: true,//클릭할때 나오게 하는거
               ),
            ],
            //X축으로 category로 표현
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'), //카테고리화 
            ),
            //Y축은 숫자로 표현
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '사이트 수'),
            ),
          ),
        ),
      ),
    );
  }
}
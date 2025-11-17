import 'package:flutter/material.dart';
import 'package:gittest_app/developer_data.dart';

class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController  controller;
 late List<DeveloperData> data;
  late List<DeveloperData>data2;
  @override
  void initState() {
    
    super.initState();
    controller =TabController(length: 5, vsync: this);
     controller= TabController(length: 5, vsync: this);
    data=[];
    data2=[];
    addData();
    addData2();

  }



   addData2(){
     data2.add(DeveloperData(year: 2017, developers: 9000));
    data2.add(DeveloperData(year: 2018, developers: 20000));
    data2.add(DeveloperData(year: 2019, developers: 17000));
    data2.add(DeveloperData(year: 2020, developers: 18000));
    data2.add(DeveloperData(year: 2021, developers: 23000));
  }

  addData(){

     data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:TabBarView(
        controller: controller,

        children: [
          // BarChart(),
          // LineChart(),
          // MultiLineChart(),
          // Scatter(),

        ]) ,
        bottomNavigationBar: Container(
          
          child: TabBar(tabs: [
            Tab(
              text: 'Bar chart',
              icon: Icon(Icons.bar_chart),
            ),
            Tab(
              text: 'Line Chart',
              icon: Icon(Icons.show_chart_outlined),
            ),
            Tab(
              text: 'Multi Line Chart',
              icon: Icon(Icons.line_axis_rounded),
            ),
            Tab(
              icon: Icon(Icons.scatter_plot),
            ),

          ]),
        ),
    );
  }
}
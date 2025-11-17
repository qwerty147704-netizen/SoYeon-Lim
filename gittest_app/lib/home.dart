import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController  controller;

  @override
  void initState() {
    
    super.initState();
    controller =TabController(length: 5, vsync: this);
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
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentDateTime;
  late bool _isRunning;
  DateTime? chosenDateTime;
  late Color color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentDateTime = '';
    _isRunning = true;
    color = Colors.white;

    Timer.periodic(Duration(seconds: 1), (timer){
        if(!_isRunning){
          timer.cancel();
        }
        _addItem();
            alarm();

        setState(() {});

        
    });

  }
    _addItem(){ // currentDateTime 설정
      DateTime now = DateTime.now();
      currentDateTime = ('${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${_weekdayToString(now.weekday)} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}');
    }

      String _weekdayToString(int weekday){ // int weekday 월화수목금토일로 변환
    String dateName = '';
    switch(weekday){
      case 1: dateName = '월';
      case 2: dateName = '화';
      case 3: dateName = '수';
      case 4: dateName = '목';
      case 5: dateName = '금';
      case 6: dateName = '토';
      case 7: dateName = '일';
    }
    return dateName;
  }

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('일정 정하기'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(currentDateTime),
            SizedBox(
              width: 380,
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                use24hFormat: true,
                onDateTimeChanged: (value) {
                  chosenDateTime = value;
                  setState(() {});

                },
              ),
            ),
            Text(chosenDateTime != null ? _chosenItem(chosenDateTime!) : '시간을 선택하세요!')

          ],
        ),
      ),
    );
  } // build
  // ----- Functions -----
  String _chosenItem(DateTime now){
    String chosenDateTime = ('${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${_weekdayToString(now.weekday)} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}');
    return chosenDateTime;
  }

  alarm(){
      DateTime now = DateTime.now();

    if(chosenDateTime != null && chosenDateTime!.minute == now.minute && chosenDateTime!.hour == now.hour){
      if(now.second % 2 == 0){
        color = Colors.yellow;
        setState(() {});
      }else if(now.second % 2 != 0){
        color = Colors.red;
        setState(() {});
      }else{
        color = Colors.white;
      }
    }
  }
}
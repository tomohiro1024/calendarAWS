import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  // 現在時刻の取得
  DateTime now = DateTime.now();
  List<String> weekName = ['月', '火', '水', '木', '金', '土', '日'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('yyyy年 M月').format(now),
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: 30,
        color: Colors.white,
        child: Row(
          children: weekName
              .map((e) => Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(e),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

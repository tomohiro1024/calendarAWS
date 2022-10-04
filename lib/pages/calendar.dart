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
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
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
          createCalenderItem(),
        ],
      ),
    );
  }

  Widget createCalenderItem() {
    List<Widget> _list = [];
    List<Widget> _listCache = [];

    // 今月の最後の日の取得(来月の1日から1日引いた日)
    int monthLastDay = DateTime(now.year, now.month + 1, 1)
        .subtract(const Duration(days: 1))
        .day;

    // 今月の1日の取得
    DateTime date = DateTime(now.year, now.month, 1);

    for (int i = 0; i < monthLastDay; i++) {
      _listCache.add(_CalenderItem(day: i + 1));
      int repeatNumber = 7 - _listCache.length;
      // 日付が日曜の場合、下に改行する。
      if (date.add(Duration(days: i)).weekday == 7) {
        if (i < 7) {
          _listCache.insertAll(
              0,
              List.generate(
                  repeatNumber, (index) => Expanded(child: Container())));
        }
        _list.add(Row(
          children: _listCache,
        ));
        _listCache = [];
      } else if (i == monthLastDay - 1) {
        _listCache.addAll(List.generate(
            repeatNumber, (index) => Expanded(child: Container())));
        _list.add(Row(
          children: _listCache,
        ));
      }
    }

    return Column(
      children: _list,
    );
  }
}

class _CalenderItem extends StatelessWidget {
  final int day;
  const _CalenderItem({required this.day, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          // color: Colors.orangeAccent,
          child: Text('$day'),
        ),
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orangeAccent),
        ),
      ),
    );
  }
}

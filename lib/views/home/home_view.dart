import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controllers/controllers.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final tableCalendarController = Get.put(TableCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }

  _appBarWidget() {
    return AppBar(
      title: const Text('TABLE CALENDAR'),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 1, 1),
              focusedDay: tableCalendarController.focusedDay.value,
              onDaySelected: (DateTime sd, DateTime fd) {
                tableCalendarController.selectedDay.value = sd;
                tableCalendarController.focusedDay.value = fd;
              },
              selectedDayPredicate: (DateTime day) {
                // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                return isSameDay(
                    tableCalendarController.selectedDay.value, day);
              },
            );
          }),
        ],
      ),
    );
  }
}

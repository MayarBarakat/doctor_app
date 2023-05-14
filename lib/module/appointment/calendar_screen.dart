import 'dart:math';

import 'package:doctor_app/module/appointment/time_slot_item.dart';
import 'package:doctor_app/module/confirm_book/confirm_book_screen.dart';
import 'package:doctor_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarController _calendarController;

  String formattedDate = "";
  int iteration = 1;

  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _calendarController = CalendarController();
    initializeDateFormatting('ar');
    // Format the date
    final date = DateTime.now();
    final formatter = DateFormat.yMMMMEEEEd('ar');
    formattedDate = formatter.format(date);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calendar'),
          backgroundColor: Color(0xff30384c),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          physics:  const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TableCalendar(
                onDaySelected: (date, days, hol) {
                  setState(() {
                    final formatter = DateFormat.yMMMMEEEEd('ar');
                    formattedDate = formatter.format(date);
                    iteration = Random().nextInt(10);
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Color(0xff30374b),
                    todayColor: Color(0xff30374b).withOpacity(0.7)),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Color(0xff30384c),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  weekendStyle: TextStyle(
                    color: Color(0xff30384c),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: Color(0xff30384c),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Color(0xff30384c),
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Color(0xff30384c),
                  ),
                ),
                calendarController: _calendarController,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,

                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color(0xff30384c),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          formattedDate,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    iteration == 0?
                      SizedBox(
                        height: 200,
                        child: Container(
                          color: Color(0xff30384c),
                        ),
                      ):
                    Column(
                      children: List.generate(iteration, (index) {
                        return TimeSlotItem(
                          fromTime: "9 AM",
                          toTime: "10 AM",
                          onBook: () {
                            navigateTo(context, SurgeryDetailsPage(surgeryType: "surgeryType", date: "date", time: "time", room: "room"));
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

}



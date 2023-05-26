import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DateConv extends StatefulWidget {
  const DateConv({Key? key}) : super(key: key);

  @override
  State<DateConv> createState() => _DateConvState();
}

class _DateConvState extends State<DateConv> {
  final List<bool> _selections = [true, false, false, false];
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Timer timer = Timer(Duration(seconds: 1), () {});
  DateTime? _selectedDay;
  String date = DateFormat('EEEE, d MMM, yyyy HH:mm:ss').format(DateTime.now());

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  void initState() {
    timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              if (_selections[0]) {
                date = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
                    .format(DateTime.now());
              } else if (_selections[1]) {
                date = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
                    .format(DateTime.now().add(Duration(hours: 1)));
              } else if (_selections[2]) {
                date = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
                    .format(DateTime.now().add(Duration(hours: 2)));
              } else {
                date = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
                    .format(DateTime.now().subtract(Duration(hours: 6)));
              }
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Konversi Zona Waktu"),
        ),
        body: Center(
          heightFactor: MediaQuery.of(context).size.height / 3,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                ToggleButtons(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'WIB',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('WITA'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('WIT'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('London'),
                    ),
                  ],
                  isSelected: _selections,
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).primaryColor,
                  renderBorder: false,
                  onPressed: (index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < _selections.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          _selections[buttonIndex] = true;
                        } else {
                          _selections[buttonIndex] = false;
                        }
                      }
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                )
              ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market Calendar"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: SfCalendar(
                view: CalendarView.month,
                dataSource: MarketDataSource(getAppointments()),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              margin: EdgeInsets.all(20),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              child: Container(
                height: 100,
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text("Event :"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Market Open ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '8 a.m - 6 p.m ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      onTap: null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];

  for (int month = 1; month <= 12; month++) {
    final int daysInMonth = DateTime(DateTime.now().year, month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      final DateTime currentDate = DateTime(DateTime.now().year, month, day);

      if (currentDate.weekday >= DateTime.monday &&
          currentDate.weekday <= DateTime.friday) {
        final DateTime startTime =
            DateTime(DateTime.now().year, month, day, 8, 0);
        final DateTime endTime =
            DateTime(DateTime.now().year, month, day, 18, 0);

        meetings.add(Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: "Market Open",
          color: Colors.blue,
        ));
      }
    }
  }

  return meetings;
}

class MarketDataSource extends CalendarDataSource {
  MarketDataSource(List<Appointment> source) {
    appointments = source;
  }
}

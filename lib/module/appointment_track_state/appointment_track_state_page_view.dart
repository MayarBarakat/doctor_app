import 'package:doctor_app/module/appointment_track_state/pages/accepted_page.dart';
import 'package:doctor_app/module/appointment_track_state/pages/under_processing_page.dart';
import 'package:flutter/material.dart';

import 'pages/rejected_operations.dart';

class AppointmentTrackStateScreen extends StatefulWidget {
  @override
  _AppointmentTrackStateScreenState createState() => _AppointmentTrackStateScreenState();
}

class _AppointmentTrackStateScreenState extends State<AppointmentTrackStateScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AcceptedPage(),
    UnderProcessingPage(),
    RejectedOperations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: BottomNavigationBar(

                  iconSize: 0.0,
                  backgroundColor: Color(0xff30384c),
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.blue,
                  selectedFontSize: 16,
                  unselectedFontSize: 13,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,),
                      label: 'العمليات المقبولة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'قيد المعالجة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'العمليات المرفوضة',
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

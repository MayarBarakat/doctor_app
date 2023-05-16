import 'package:doctor_app/shared/components/components.dart';
import 'package:flutter/material.dart';

import 'my_surgery_details_screen.dart';

class MySurgeryScreen extends StatelessWidget {

  const MySurgeryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عملياتي",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Color(0xff30384c),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          separatorBuilder: (context,index){
            return const SizedBox(height: 10,);
          },
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/doctor_surgery.png"
                  ),
                  title: Text(
                    'Surgery Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Patient Name',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Surgery Date',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Surgery Time',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Center(child: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                  onTap: () {
                    navigateTo(context, SurgeryDetailsScreen(
                      bookingDate: "2023/3/4",
                      patientName: "John",
                      surgeryDate: "2023/6/2",
                      surgeryInfo: "done successfully",
                      surgeryStatus: true,
                    ));
                  },
                ),
              ),
            );

          },
        ),
      ),
    );
  }
}

class Surgery {
  final String name;
  final String patientName;
  final String date;
  final String time;

  const Surgery({
    required this.name,
    required this.patientName,
    required this.date,
    required this.time,
  });
}

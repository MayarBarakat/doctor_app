import 'package:doctor_app/module/auth_pages/login/my_button.dart';
import 'package:doctor_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class SurgeryDetailsPage extends StatelessWidget {
  final String surgeryType;
  final String date;
  final String time;
  final String room;

  SurgeryDetailsPage({required this.surgeryType, required this.date, required this.time, required this.room});


  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surgery Details'),
        backgroundColor: Color(0xff30384c),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Surgery Type:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  surgeryType,
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Alrayee Hospital",
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Date:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Alrayee Hospital",
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Time:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Alrayee Hospital",
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Room:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  room,
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Alrayee Hospital",
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "أدخل اسم المريض والمتطلبات الخاصة بالعملية إن وجدت",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                myTextField(
                    controller: patientNameController,
                    hintText: "Patient Name",
                    obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Alrayee Hospital",
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                myTextField(
                  controller: requirementsController,
                  hintText: "Requirements",
                  obscureText: false,
                ),
                SizedBox(height: 10,),
                MyButton(onTap: (){},text: "Send Book",)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

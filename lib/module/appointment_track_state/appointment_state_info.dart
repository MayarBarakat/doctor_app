import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/components/size_config.dart';


class AppointmentInfo extends StatelessWidget {

  late final String text;
  late final String image;
  late final bool json;
  late final String status;
  late final Color color;

  AppointmentInfo({
    required this.text,
    required this.image,
    required  this.json,
    required this.status,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig()..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)
        ),
        title: Text(text, style: TextStyle(color: Colors.black, fontWeight:
        FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
            json?Lottie.asset(
                "assets/lottie/${image}",
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill
            ):
            Image.asset('assets/images/${image}',
              height: SizeConfig.screenHeight! * 0.4, //40%,
                fit: BoxFit.cover
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.08,
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: getProportionsScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoItem('Date of Booking', 'May 20, 2023'),
                  SizedBox(height: 16.0),
                  _buildInfoItem('Date of Surgery', 'June 5, 2023'),
                  SizedBox(height: 16.0),
                  _buildInfoItem('Patient Name', 'John Doe'),
                  SizedBox(height: 16.0),
                  _buildInfoItem(
                    'Requirements',
                    'Detailed information about surgery requirements.',
                  ),
                  SizedBox(height: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Center(
                child: Text(
                  "Status",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
                  SizedBox(height: 20,)

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          value,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
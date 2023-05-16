import 'package:flutter/material.dart';

class SurgeryDetailsScreen extends StatelessWidget {
  final String bookingDate;
  final String surgeryDate;
  final String surgeryInfo;
  final String patientName;
  final bool surgeryStatus;

  SurgeryDetailsScreen({
    required this.bookingDate,
    required this.surgeryDate,
    required this.surgeryInfo,
    required this.patientName,
    required this.surgeryStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surgery Details'),
        centerTitle: true,
        backgroundColor: Color(0xff30384c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Booking Date', bookingDate),
            _buildInfoRow('Surgery Date', surgeryDate),
            _buildInfoRow('Surgery Information', surgeryInfo),
            _buildInfoRow('Patient Name', patientName),
            Center(child: _buildStatusRow(surgeryStatus)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
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
      ),
    );
  }

  Widget _buildStatusRow(bool status) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Surgery Status',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: status ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              status ? 'Accepted' : 'Rejected',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MySurgeryScreen extends StatelessWidget {
  final List<Surgery> surgeries;

  const MySurgeryScreen({Key? key, required this.surgeries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عملياتي"),
        centerTitle: true,
        backgroundColor: Color(0xff30384c),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: surgeries.length,
          separatorBuilder: (context,index){
            return const SizedBox(height: 10,);
          },
          itemBuilder: (context, index) {
            final surgery = surgeries[index];
            return Card(

              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    child: const Icon(Icons.local_hospital, color: Colors.white),
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
                    // do something when the tile is tapped
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

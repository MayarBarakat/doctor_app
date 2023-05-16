import 'package:doctor_app/module/appointment_track_state/appointment_state_info.dart';
import 'package:doctor_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class RejectedOperationsPage extends StatefulWidget {
  @override
  State<RejectedOperationsPage> createState() => _RejectedOperationsPageState();
}

class _RejectedOperationsPageState extends State<RejectedOperationsPage> {
  List<Trip> trips = [
    Trip(
        title: 'Beach Paradise', price: '350', nights: '3', img: 'surgery.jpg'),
    Trip(title: 'City Break', price: '400', nights: '5', img: 'surgery.jpg'),
    Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'surgery.jpg'),
  ];

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1500));
    trips.add(Trip(title: 'Space Blast', price: '600', nights: '4', img: 'surgery.jpg'));

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    setState(() {

    });
  }

  Widget _buildTile(Trip trip,context) {
    return ListTile(
      onTap: () {
        navigateTo(
            context,
            AppointmentInfo(
                text: "الحجز مرفوض",
                image: "rejected.png",
                json: false,
                status: "Rejected",
              color: Colors.red,
            )
        );
      },
      contentPadding: const EdgeInsets.all(25),

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(trip.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/rejected.png',
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.separated(
            itemCount: trips.length,
            shrinkWrap: false,
            separatorBuilder: (context,index){
              return SizedBox(height: 10,);
            },

            itemBuilder: (context, index) {
              return _buildTile(trips[index],context);
            }),
      ),
    );
  }
}

class Trip {
  final String title;
  final String price;
  final String nights;
  final String img;

  Trip({required this.title, required this.price, required this.nights, required this.img});
}
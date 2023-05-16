import 'dart:async';

import 'package:doctor_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../appointment_state_info.dart';

class AcceptedPage extends StatefulWidget {
  @override
  State<AcceptedPage> createState() => _AcceptedPageState();
}

class _AcceptedPageState extends State<AcceptedPage> {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1500));
    // if failed,use refreshFailed()
    trips.add(Trip(title: 'Space Blast', price: '600', nights: '4', img: 'surgery.jpg'));

    _refreshController.refreshCompleted();
    setState(() {

    });
  }

  List<Trip> trips = [
    Trip(
        title: 'Beach Paradise', price: '350', nights: '3', img: 'surgery.jpg'),
    Trip(title: 'City Break', price: '400', nights: '5', img: 'surgery.jpg'),
    Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'surgery.jpg'),
  ];

  Widget _buildTile(Trip trip,context) {
    return ListTile(

      onTap: () {
        navigateTo(context, AppointmentInfo(
            text: "تم قبول الحجز",
            image: "check.png",
            json:false,
          status: "Accepted",
          color: Colors.green[800]!,
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
        child:  Image.asset(
            'assets/images/accepted.png',

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
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
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

  Trip(
      {required this.title,
      required this.price,
      required this.nights,
      required this.img});
}

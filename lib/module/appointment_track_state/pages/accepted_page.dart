import 'package:flutter/material.dart';


class AcceptedPage extends StatelessWidget {
  List<Trip> trips = [
    Trip(
        title: 'Beach Paradise', price: '350', nights: '3', img: 'surgery.jpg'),
    Trip(title: 'City Break', price: '400', nights: '5', img: 'surgery.jpg'),
    Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'surgery.jpg'),
    Trip(title: 'Space Blast', price: '600', nights: '4', img: 'surgery.jpg'),
  ];

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
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
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'assets/images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView.separated(
        itemCount: trips.length,
          separatorBuilder: (context,index){
          return SizedBox(height: 10,);
          },

          itemBuilder: (context, index) {
            return _buildTile(trips[index]);
          }),
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
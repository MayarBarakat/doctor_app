import 'package:flutter/material.dart';

class UnderProcessingPage extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal:screenWidth / 20
        ),
        child: Column(
          children: [


            const SizedBox(height: 40,),
            ListView.builder(
              itemCount: 10,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context , index){
                return item(index);
              },
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget item(int index){
    return Container(
      height: 55,
      margin: EdgeInsets.only(
          bottom: 12
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20
      ),
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${index + 1} Mayar Mayar my',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(Icons.abc),
        ],
      ),
    );
  }
}

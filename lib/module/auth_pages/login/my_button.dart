import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Color(0xff30384c),
          borderRadius: BorderRadius.circular(8)
        ),
        child:  Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

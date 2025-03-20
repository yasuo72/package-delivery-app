import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child:  Center(
          child: Text(
            text,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

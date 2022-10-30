import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final IconData icon;
     const HomeScreenCard({super.key, required this.title,required this.onPressed, required this.icon, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 150,

        decoration: const BoxDecoration(
          color: Color(0xff003661),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
            child: Icon(icon, size: 40,),
           ),
              Center(child: Text(title,style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),)),
            ],
          ),
        ),
      ),
    );
  }
}

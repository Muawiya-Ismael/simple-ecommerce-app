import 'package:flutter/material.dart';


class DrawerIcon extends StatelessWidget {
  const DrawerIcon({ required this.text,required this.icon,super.key});
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child:ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

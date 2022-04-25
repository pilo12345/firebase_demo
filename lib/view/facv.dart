import 'package:flutter/material.dart';

class Favi extends StatefulWidget {
  const Favi({Key? key}) : super(key: key);

  @override
  _FaviState createState() => _FaviState();
}

class _FaviState extends State<Favi> {
  bool ratting = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ratting = !ratting;
        });
      },
      child: CircleAvatar(
        backgroundColor: Color(0xfff2f2f2),
        child: Icon(
          ratting ? Icons.favorite_border : Icons.favorite,
          color: Colors.blue,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class Middle12 extends StatefulWidget {
  const Middle12({super.key});

  @override
  State<Middle12> createState() => _Middle12State();
}

class _Middle12State extends State<Middle12> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
      child: Column(
      children: [
      Container(
      height: 200,
      width: 500,
      child: Image.asset("assets/laptop2.jpg"),
    ),],),));
  }
}

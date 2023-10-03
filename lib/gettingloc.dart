import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:second_project/weatherinfo.dart';
class Location extends StatefulWidget{
  const Location({Key? key}) : super(key: key);

  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>{
  String lat="";
  String lon = "";


  void getloc()async{
    Position pos = await Geolocator.getCurrentPosition();
    print(pos);
    print(pos.latitude);
    print(pos.longitude);
    setState(() {
      lat=(pos.latitude).toString();
      lon = (pos.longitude).toString();
    });


  }

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Get You Location",
          style: TextStyle(color: Colors.white),

        ),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.location_history_sharp , color: Colors.white,)),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.satellite))],

        ),
      body:Center(
        child: Column(
          children: [
            Container(height: 300, width:700 ,
              child: Image.asset('assets/location.jpg'),),
            SizedBox(height: 50),
            Icon(Icons.location_history_rounded ,color: Colors.blueAccent, ),
            SizedBox(height: 20,),
            ElevatedButton( style: ButtonStyle(
            shape: MaterialStateProperty.all<
            RoundedRectangleBorder>(
            RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(100.0),

        side: BorderSide()))),
             onPressed : (){
              getloc();},
                child: Text("Get Location")),
            SizedBox(height:20,),
            Icon((Icons.location_on), color: Colors.red,),
            Text(("Lat: $lat, Lon: $lon")),
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));}, child: Text("Weather Condition"))
          ],
        ),
      ),
    );
  }



}
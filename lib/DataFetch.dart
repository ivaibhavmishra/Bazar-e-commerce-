import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
import 'package:second_project/UserPanel.dart';

class DataSet extends StatefulWidget{
  const DataSet({Key? key}) : super(key: key);
  State<DataSet> createState()=> _DataSetState();
}

class _DataSetState extends State<DataSet>{
  var x="";
  var y="";
  var z="";
  void DataFetch()async{
    final op = await http.get(Uri.parse('https://api.thingspeak.com/channels/1596152/feeds.json?api_key=P7S0UYX236LLKQJU&results=10'),);

    print(op);
    var data = jsonDecode(op.body.toString());
    print(data);
    print(data['channel']['field1']);
    print(data['channel']['field2']);
    print(data['channel']['field3']);
    setState(() {
      x= data['channel']['field1'];
      y = data['channel']['field2'];
      z= data['channel']['field3'];
    });
  }
    Widget build(BuildContext context) {

      return Scaffold(
          body:
          Center(
          child: Column(
          children: [SizedBox(height: 400,),
            ElevatedButton(onPressed: (){DataFetch();}, child: Text("Get Data")),

            Text((x)),
            Text(y),
            Text(z),
          ]
      )

      )
      );}
}
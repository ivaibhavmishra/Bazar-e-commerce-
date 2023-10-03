import 'package:flutter/material.dart';
import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:second_project/UserPanel.dart';

class Login extends StatefulWidget{
  const Login ({Key? key}) : super(key : key);
  State<Login> createState() => _LoginState();

}
class _LoginState extends State<Login>{
  TextEditingController city = TextEditingController();

  TextEditingController state = TextEditingController();

  TextEditingController country = TextEditingController();


  var lat = "";
  var lon = "";
var temp;
var press;
var humd;
  
  void getLoc()async{
    var _city = city.text;
    var _state = state.text;
    var _country= country.text;
    final loc = await http.get(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=$_city,$_state,$_country&limit=1&appid=c7fdefff93fceb31a8eecab096180734'));
    var data = jsonDecode(loc.body.toString());
    print("data");

    lat= data[0]['lat'].toString();
    lon= data[0]['lon'].toString();

  }
  
  void weatherInfo()async{
    getLoc();
    print("weather");
    print(lat);
    print(lon);
    final res = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=c7fdefff93fceb31a8eecab096180734'),);
    print(res);
    var data = jsonDecode(res.body.toString());
    print(data);
    print(data['main']['temp']);
    print(data['main']['pressure']);
    print(data['main']['humidity']);

    setState(() {
      temp= data['main']['temp'];
      press = data['main']['pressure'];
      humd = data['main']['humidity'];
    });
  }

  @override
  Widget build(BuildContext context) {
    //weatherInfo();
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            "Weather Information",
            style: TextStyle(color: Colors.white),
          ),

          actions: [IconButton(onPressed: () {
            print('button pressed');
          }, icon: Icon(Icons.storm))
          ],

        ),
        body:
        Center(
            child: Column(
              children: [
                Container(height: 300, width: 300,
                  child: Image.asset('assets/weather.png'),
                ),
                SizedBox(height: 10,),

                TextField(controller: city,
                  decoration: InputDecoration(hintText: "Enter your city",
                      filled: true),),
                SizedBox(height: 0),
                TextField(controller: state,
                  decoration: InputDecoration(hintText: "Enter your State",
                      filled: true),),
                SizedBox(height: 0),
                TextField(controller: country,
                  decoration: InputDecoration(hintText: "Enter your Country",
                      filled: true),),
                SizedBox(height: 0,),
                ElevatedButton(onPressed: () {getLoc();
                  weatherInfo();
                }, child: Text("Weather info")),
                Text(("Temprature : $temp")),
                Text(("Pressure : $press")),
                Text(("Humidity : $humd")),
              ],
            )));
  }

}
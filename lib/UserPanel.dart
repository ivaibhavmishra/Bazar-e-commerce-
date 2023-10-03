import 'package:flutter/material.dart';
import 'package:second_project/gettingloc.dart';
import 'LoginPage.dart';
import 'main.dart';
import 'package:http/http.dart'as http;




class BMICALC extends StatefulWidget{
  const BMICALC({Key? key}) : super(key: key);

  State<BMICALC> createState() => _BMICALCState();

}
class _BMICALCState extends State<BMICALC> {
  TextEditingController _height = TextEditingController();

  TextEditingController _weight = TextEditingController();
  double? BMI ;

  void  bmi() {
    double height = double.parse(_height.text);
    double weight = double.parse(_weight.text);
    print(weight);
    print(height);
    BMI = weight/(height*height);
    print(BMI);
    setState(() {
      BMI = weight/(height*height);
    });


  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Body Mass Index",
          style: TextStyle(color: Colors.white),
        ),
          actions: [IconButton(onPressed: (){print("button pressed");}, icon: Icon(Icons.sports_gymnastics))],

      ),

      body: Center(

        child: Column(
          children:<Widget>[
            Container( height : 400 , width:400,
              child: Image.asset('assets/healthylifepic1.jpg'),),
            TextField(controller: _height, decoration: InputDecoration(hintText: "Enter your height in meter",
               filled: true),),
            //SizedBox(height: 10,),
            TextField(controller: _weight, decoration: InputDecoration(hintText: "Enter your weight in kg",
              filled: true ),),
          ElevatedButton(onPressed: (){bmi();}, child: Text("BMI"), ),
            Text("Your BMI is $BMI"),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Location()));
            }, child: Text("Get Your Location")),
      ],
      ),

      ),
);
}}

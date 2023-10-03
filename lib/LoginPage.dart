import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project/FirstPage.dart';
//import 'LoginPage.dart';
import 'UserPanel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'weatherinfo.dart';
class MyApp extends StatefulWidget{
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();
  
  void initState(){
    Firebase.initializeApp();
    super.initState();
  }
  
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,

              title: Text(
                "Flutter First Application",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.home ,color: Colors.white) ,
              actions: [IconButton(onPressed: (){print('button pressed'); } ,icon: Icon(Icons.add))
                ,IconButton(onPressed: (){print('button pressed');}, icon: Icon(Icons.public_outlined))],
            ),
            body:
            Center(
              child:Column(
                children: <Widget>[ SizedBox(height :100,),
                  Container( height : 200 , width:200,
                  child: Image.asset('assets/homepic.png'),),
                  SizedBox(height: 50),
                  TextField(controller: _email, decoration: InputDecoration(hintText: "Enter your email",
                      filled: true),),
                  SizedBox(height: 5),
                  TextField(controller: _pass, decoration: InputDecoration(hintText: "Enter your Password",
                      filled: true ),obscureText: true),
                  ElevatedButton(onPressed: (){
                    FirebaseAuth.instance.signInWithEmailAndPassword
                      (email: _email.text, password: _pass.text).then((value) { print("looged in");

                   }).
                    onError( ((error, stackTrace){print(error);}));
                    
                      }, child: Text("Login")),

                  ElevatedButton(onPressed: (){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _pass.text).then((value) { print("Successfully Registered");}).onError((error, stackTrace) {});
                    }, child: Text("Register"))
                     //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

          ],





              ),
            )));
  }
}
//Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
//                  


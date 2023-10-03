import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:second_project/CounterProvider.dart';
import 'package:second_project/FirstPage.dart';
import 'package:second_project/Login_ecommerceapp1.dart';
import 'package:second_project/gettingloc.dart';
import 'package:second_project/weatherinfo.dart';
import 'DataFetch.dart';
import 'LoginPage.dart';
import 'UserPanel.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'app_provider.dart';
import 'gettingloc.dart';
import 'weatherinfo.dart';
import 'CounterProvider.dart';
import 'FirstPage.dart';
import 'Login_ecommerceapp1.dart';


void main()async{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider())
  ],))
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Firstpage()
     // duration:10 ,
    );

  }
}

//AnimatedSplashScreen(
//splash: Image.asset('assets/gymmm1.jpg'),
//nextScreen:

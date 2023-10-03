import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:second_project/Premiums.dart';
import 'package:second_project/SearchBar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:second_project/ShoppingCart.dart';
import 'Horizontal_list_view.dart';
import 'package:second_project/productsoffer.dart';
import 'package:second_project/Premiums.dart';
import 'app_provider.dart';
import 'middle12.dart';
import 'package:second_project/ShoppingCart.dart';
import 'package:second_project/Login_ecommerceapp1.dart';
import 'Signup.dart';
class Firstpage extends StatefulWidget{

  const Firstpage({Key? key}) : super(key: key);

  State<Firstpage> createState()=> _FirstpageState();
}
class _FirstpageState extends State<Firstpage>{
  void initState(){
    Firebase.initializeApp();
    super.initState();
  }


  Widget build(BuildContext context){

       AppProvider appProvider = Provider.of<AppProvider>(context);
       return Scaffold(

        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.redAccent,
          title: Text("Bazaar", strutStyle: StrutStyle( fontStyle: FontStyle.normal),
        style: TextStyle(color: Colors.white),),

        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchbar()));
        }, icon: Icon(Icons.search)),
        IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));}, icon: Icon(Icons.shopping_cart))
        ],
      ),

         drawer: new Drawer(
           backgroundColor: Colors.white,
           child: new ListView(
             children: <Widget>[

               new UserAccountsDrawerHeader(  accountName: Text('Vaibhav Mishra'), accountEmail: Text('vaibhav2005mishra@gmail.com') ,
               decoration: new BoxDecoration(color: Colors.redAccent),
               currentAccountPicture: GestureDetector(
                 child: CircleAvatar(
                   backgroundColor: Colors.grey,
                   child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_e()));}, icon: Icon(Icons.person) , color: Colors.white,),
                 ),
               ),
               ),
               InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Home Page'),
                   leading: Icon(Icons.home, color: Colors.redAccent,),
                 ),
               ),
               InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('My Account'),
                   leading: Icon(Icons.person, color: Colors.redAccent,),
                 ),
               ),
               InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('My Order'),
                   leading: Icon(Icons.shopping_basket, color: Colors.redAccent,),
                 ),
               ),
               InkWell(
                 onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> cart()));},
                 child: ListTile(
                   title: Text('Shopping cart'),
                   leading: Icon(Icons.shopping_cart, color: Colors.redAccent,),
                 ),
               ),
               // InkWell(
               //   onTap: (){Logo},
               //   child: ListTile(
               //     title: Text('Logout'),
               //     leading: Icon(Icons.arrow_back, color: Colors.redAccent,),
               //   ),
               // ),
               InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Favourites'),
                   leading: Icon(Icons.favorite, color: Colors.redAccent,),
                 ),
               ),
               Divider(),
               InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Settings'),
                   leading: Icon(Icons.settings, color: Colors.grey,),
                 ),
               ),
               InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('About'),
                   leading: Icon(Icons.help, color: Colors.blueAccent,),
                 ),
               )
             ],
           ),

         ),
           body: ListView(
               children: <Widget>[  Container(
                 height: 250,
                 child: Carousel(
                   boxFit: BoxFit.cover,
                   images: [
                     Topslide(Sliding_image:"assets/new.jpg" ,),
                     Topslide(Sliding_image:"assets/new14.jpg" ,),
                     Topslide(Sliding_image:"assets/new12.jpg" ,),
                     Topslide(Sliding_image:"assets/new13.jpg" ,),
                     Topslide(Sliding_image:"assets/new4.jpg" ,),
                     Topslide(Sliding_image:"assets/new8.jpeg" ,),
                     Topslide(Sliding_image:"assets/new9.jpg" ,),
                     //ExactAssetImage("assets/new.jpg"),
                     // ExactAssetImage("assets/new14.jpg"),
                     // ExactAssetImage("assets/new12.jpg"),
                     // ExactAssetImage("assets/new13.jpg"),
                     // ExactAssetImage("assets/new4.jpg"),
                     // ExactAssetImage("assets/new8.jpeg"),
                     // ExactAssetImage("assets/new9.jpg"),

                   ],
                   autoplay: true,
                   animationCurve: Curves.fastOutSlowIn,
                   animationDuration: Duration(milliseconds: 1000),
                   dotSize: 5.0,

                   dotPosition: DotPosition.bottomCenter,
                   dotVerticalPadding: 0,
                   showIndicator: true,
                   indicatorBgPadding: 2.0,
                   dotBgColor: Colors.transparent,
                 ),
               ),

               new Padding(padding: const EdgeInsets.all(10),
               child: Text('Categories' ,style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold, fontSize: 17),)),
                 Container(
                   height: 100,
                   child: HorizontalList(),
                 ),


                new Padding(padding: const EdgeInsets.all(10),
                child: Text('Best Offers ',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold, fontSize: 17),)),



                 Container(
                   height: 300.0,
                   child: Productoffers(),
                 ),

                 Container(

                   height: 200,
                   child: Middle12(),
                 ),

                 new Padding(padding: const EdgeInsets.all(10.0),
                 child: Text('Our Premiums',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold, fontSize: 17),)),
                 //Middle12(),
                 Container(
                 height: 350.0,
                   child: Premiums(),

                 ),
                 Text(appProvider.premiumProducts.length.toString(), style:  TextStyle(color:  Colors.black),),
               ]

           )


       );


  }
}


class Topslide extends StatelessWidget {
  final Sliding_image;
  const Topslide({this.Sliding_image});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(onTap: (){print("pressed");},
            child: Container(
              child: ListTile(
                title: Image.asset(Sliding_image),
              ),
            )
    ));
  }

}

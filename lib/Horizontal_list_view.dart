import 'package:flutter/material.dart';
import 'CategoriesDetail.dart';


class HorizontalList extends  StatelessWidget{

  Widget build(BuildContext context){
    return Container(
      height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,

          children: <Widget >[
            Category(
              image_location: 'assets/smartphone6.jpg',image_caption: 'Phones' , ),
            Category(
                image_location: 'assets/Tv1.png',image_caption: 'TV',),
            Category(
                image_location: 'assets/Laptop1.jpg',image_caption: 'Laptop',),
            Category(
                image_location: 'assets/speaker2.jpg',image_caption: 'Speakers',),
            Category(
                image_location: 'assets/watch1.jpg',image_caption: 'Watches',),
            Category(
                image_location: 'assets/fan2.jpg',image_caption: 'Fans', ),
            Category(
                image_location: 'assets/induction2.jpg',image_caption: 'Induction'),
            Category(
                image_location: 'assets/iron1.jpg',image_caption: 'Iron',),


          ], )

      ,) ;}
}
class Category extends StatelessWidget {
  final String  image_location;
  final String image_caption;
   Category({  required this.image_caption,  required this.image_location});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(0.0),
    child: InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryDetails()));},
    child: Container(
    width: 120.0,
    child: ListTile(
      title: Image.asset(
      width: 100.0,
      height: 80.0,image_location,),
      subtitle: Container(
        alignment: Alignment.topCenter,
        child: Text(image_caption, style: TextStyle(color: Colors.blue),),
      ) ,

    ),
    ),),);
  }
}


// class Category extends StatelessWidget {
//
//   final String image_location;
//
//   final String image_caption;
//
//   Category({this.image_location  , this.image_caption } 
//       );
//
//   //Category({required this.image_location , required this.image_caption ,});
//
//
//   Widget build(BuildContext context) {
//     return Padding(padding: const EdgeInsets.all(2.0),
//       child: InkWell(onTap: () {},
//         child: ListTile(
//             title: Image.asset(image_location,
//               width: 100.0,
//               height: 80.0,),
//             subtitle: Container(
//               alignment: Alignment.topCenter,
//               child: Text(image_caption),
//             )
//         ),),);
//   }
//
// } //Category(this.image_location ,this.image_caption);

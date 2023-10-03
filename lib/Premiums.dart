import 'package:flutter/material.dart';
import 'PremiumProductDetail.dart';
class Premiums extends StatefulWidget {
  //const Premiums({super.key});

  @override
  State<Premiums> createState() => _PremiumsState();
}

class _PremiumsState extends State<Premiums> {
  var product_list =[{

    "name" :"iphone" ,
    "photo": "assets/iphone1.jpg",
    "MRP": "345",
    "New_Price" : "34",
    "details": "",
    "brand": "Brand x",
    "condition" : "New"
  },
    {
      "name" :"Laptop" ,
      "photo": "assets/laptop3.jpg" ,
      "MRP": "345",
      "New_Price" : "34",
      "details": "",
      "brand": "Brand x",
      "condition" : "New"
    },
    {
      "name" :"Digital Watch" ,
      "photo": "assets/watch2.jpg" ,
      "MRP": "345",
      "New_Price" : "34",
      "details": "",
      "brand": "Brand x",
      "condition" : "New"
    }
    ,
    {
      "name" :"Analog Watch" ,
      "photo": "assets/watch3.jpg" ,
      "MRP": "345",
      "New_Price" : "34",
      "details": "",
      "brand": "Brand x",
      "condition" : "New"
    }
    ,
    {
      "name" :"Washing Machine" ,
      "photo": "assets/washingmachine2.jpg" ,
      "MRP": "345",
      "New_Price" : "34",
      "details": "",
      "brand": "Brand x",
      "condition" : "New"
    },
    {
      "name" :"Mobile" ,
      "photo": "assets/phone1.jpg" ,
      "MRP": "345",
      "New_Price" : "34",
      "details": "",
      "brand": "Brand x",
      "condition" : "New"
    }

  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder:(BuildContext context, int index){
      return Products(
        product_name: product_list[index]['name'],
        product_photo: product_list[index]['photo'],
        product_MRP: product_list[index]['MRP'],
        product_price: product_list[index]['New_Price'],
        product_detail: product_list[index]['details'],
        product_brand: product_list[index]['brand'],
        product_condition: product_list[index]['condition'],
      );
    });
  }
}
class Products extends StatelessWidget {
  final product_name;
  final product_photo;
  final product_MRP;
  final product_price;
  final product_detail;
  final product_brand;
  final product_condition;


  Products({
    this.product_name,
    this.product_photo,
    this.product_MRP,
    this.product_price,
    this.product_detail,
    this.product_brand,
    this.product_condition
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("product_name,"),
        child: Material(
          child: InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => PremiumProductDetails(
              product_detail_name: product_name,
              product_detail_price: product_price,
              product_detail_MRP: product_MRP,
              product_detail_photo: product_photo,
              product_detail_detail: product_detail,
              product_detail_brand: product_brand,
              product_detail_condition: product_condition,
            )));},
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\$$product_price" ,
                    style: TextStyle( color: Colors.red , fontWeight: FontWeight.bold),),
                  subtitle: Text("\$$product_MRP",
                    style: TextStyle( color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),

                ),
              ),
              child: Image.asset(product_photo,
                  fit:BoxFit.cover),
            )
            ,
          ),
        ),
      ),
    );

  }
}
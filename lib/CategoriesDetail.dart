import 'package:flutter/material.dart';
import 'package:second_project/SearchBar.dart';
class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var product_list =[{

    "name" :"Pumps" ,
    "photo": "assets/new4.jpg",
    "MRP": "345",
    "New_Price" : "34"
  },
    {
      "name" :"Iron" ,
      "photo": "assets/iron2.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    },
    {
      "name" :"Digital Watch" ,
      "photo": "assets/watch2.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    }
    ,
    {
      "name" :"Analog Watch" ,
      "photo": "assets/watch3.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    }
    ,
    {
      "name" :"Washing Machine" ,
      "photo": "assets/washingmachine2.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    },
    {
      "name" :"Mobile" ,
      "photo": "assets/phone1.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    },
    {

      "name" :"Pumps" ,
      "photo": "assets/new4.jpg",
      "MRP": "345",
      "New_Price" : "34"
    },
    {
      "name" :"Iron" ,
      "photo": "assets/iron2.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    },
    {
      "name" :"Digital Watch" ,
      "photo": "assets/watch2.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    }
    ,
    {
      "name" :"Analog Watch" ,
      "photo": "assets/watch3.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    }
    ,
    {
      "name" :"Washing Machine" ,
      "photo": "assets/washingmachine2.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    },
    {
      "name" :"Mobile" ,
      "photo": "assets/phone1.jpg" ,
      "MRP": "345",
      "New_Price" : "34"
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        title: Text("Bazaar", strutStyle: StrutStyle( fontStyle: FontStyle.normal),
          style: TextStyle(color: Colors.white),),

        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchbar()));
        }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: GridView.builder(itemCount: product_list.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder:(BuildContext context, int index) {
            return Products(
              product_name: product_list[index]['name'],
              product_photo: product_list[index]['photo'],
              product_MRP: product_list[index]['MRP'],
              product_price: product_list[index]['New_Price'],

            );
          })
    );


  }
}
class Products extends StatelessWidget {
  final product_name;
  final product_photo;
  final product_MRP;
  final product_price;

  Products({
    this.product_name,
    this.product_photo,
    this.product_MRP,
    this.product_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("product_name"),
        child: Material(
          child: InkWell(
            onTap: (){},
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
                    style: TextStyle( color: Colors.black , fontWeight: FontWeight.bold),),

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
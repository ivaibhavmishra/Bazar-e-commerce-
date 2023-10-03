import 'package:flutter/material.dart';
import 'package:second_project/SearchBar.dart';
import 'package:second_project/CartProducts.dart';
class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.redAccent,
        title: Text("Cart", strutStyle: StrutStyle( fontStyle: FontStyle.normal),
          style: TextStyle(color: Colors.white),),

        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchbar()));
        }, icon: Icon(Icons.search)),

        ],
      ),
    body: Cart_products(),
    bottomNavigationBar: Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(child: ListTile(
            title: Text("Total"),
          subtitle: Text("\$230"),)),
          Expanded(child: MaterialButton(onPressed: (){},
          child: Text("Check out", style: TextStyle(color: Colors.white),),
          color: Colors.redAccent,
          )

          )],
      ),
    ),);
  }
}


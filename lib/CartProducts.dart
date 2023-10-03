import 'package:flutter/material.dart';
import 'package:second_project/ShoppingCart.dart';
class Cart_products extends StatefulWidget {
  const Cart_products({super.key});

  @override
  State<Cart_products> createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Cart_product_list=[
    {

      "name": "Pumps",
      "photo": "assets/new4.jpg",
      "MRP": "345",
      "New_Price": "34",
      "details": "A submersible pump is fitted with watertight seals and gaskets. This type of sealed structure prevents the leakage of fluid from the submersible pump. The internal components of the pump remain completely sealed which eliminates any possibility of electrical accident,  pump is not noisy when the motor is running since the pump remains submerged. Therefore, the sound is muffled to some extent by the water or any other liquid wherein the pump remains."
          "The materials used for the manufacturing of a submersible pump are capable of resisting corrosion. The hermetic sealing of the pump also prevents exposure to corrosive material or oxidation.The convenient placement of a submersible pump increases its efficiency since it remains submerged in water. Therefore, this type of pumping device can quickly and efficiently transfer the fluid.The submersible pumps are low-maintenance pumping devices because of their design and where they are installed. There is no need for priming and there is no possibility of damage to the internal components resulting from the exposure to foreign elements due to hermetic sealing of submersible pumps. Therefore, this type of pumping device can be maintained easily and economically."
          "The submersible pumps are low-maintenance pumping devices because of their design and where they are installed. There is no need for priming and there is no possibility of damage to the internal components resulting from the exposure to foreign elements due to hermetic sealing of submersible pumps. Therefore, this type of pumping device can be maintained easily and economically.",
      "brand": "Brand x",
      "condition": "New",
      "color": "red",
      "quantity": "1"
    },
    {
      "name": "Iron",
      "photo": "assets/iron2.jpg",
      "MRP": "345",
      "New_Price": "34",
      "details": "A clothes iron (also flatiron, smoothing iron, or simply iron) is a small appliance that, when heated, is used to press clothes to remove wrinkles and unwanted creases. Domestic irons generally range in operating temperature from between 121 °C (250 °F) to 182 °C (360 °F). It is named for the metal (iron) of which the device was historically made, and the use of it is generally called ironing, the final step in the process of laundering clothes."
          "Ironing works by loosening the ties between the long chains of molecules that exist in polymer fiber materials. With the heat and the weight of the ironing plate, the fibers are stretched and the fabric maintains its new shape when cool. Some materials, such as cotton, require the use of water to loosen the intermolecular bonds."
      ,
      "brand": "Brand Y",
      "condition": "Refurnished",
      "color": "red",
      "quantity": "1"
    },
  ];
  @override
  Widget build(BuildContext context) {

       return ListView.builder(
           itemCount: Cart_product_list.length,
           itemBuilder: (BuildContext context, int index){
             return Cart_Product(
               cart_product_name: Cart_product_list [index] ['name'],
               cart_product_price: Cart_product_list[index]['New_Price'],
                 cart_product_MRP: Cart_product_list[index]['MRP'],
               cart_product_photo: Cart_product_list[index]['photo'],
               cart_product_details: Cart_product_list[index]['details'],
               cart_product_brand: Cart_product_list[index]['brand'],
               cart_product_condition: Cart_product_list[index]['condition'],
               cart_product_color: Cart_product_list[index]['color'],
               cart_product_quantity: Cart_product_list[index]['quantity'],
             );
           });


  }}

class Cart_Product extends StatelessWidget {
  final cart_product_name;
  final cart_product_price;
  final cart_product_MRP;
  final cart_product_photo;
  final cart_product_details;
  final cart_product_brand;
  final cart_product_condition;
  final cart_product_color;
  final cart_product_quantity;

  const Cart_Product({
    this.cart_product_name,
    this.cart_product_price,
    this.cart_product_MRP,
    this.cart_product_photo,
    this.cart_product_details,
    this.cart_product_brand,
    this.cart_product_condition,
    this.cart_product_color,
    this.cart_product_quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading:Image.asset(cart_product_photo, width: 80,height: 80,),
          title: Text(cart_product_name),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Padding(padding: const EdgeInsets.all(0),
                  child: Text("Color :"),),
                  Padding(padding: const EdgeInsets.all(4),
                  child: Text(cart_product_color, style: TextStyle(color: Colors.redAccent),),)
                ],
              ),

              new Container(
                alignment: Alignment.topLeft,
                child: Text("\$${cart_product_price}", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.redAccent),),
              )
            ],
          ),
          trailing: Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_up)),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down))
            ],
          ),
        )
    );
  }
}

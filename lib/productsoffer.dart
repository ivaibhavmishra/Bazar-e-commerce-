import 'package:flutter/material.dart';
import 'BestofferProductDetail.dart';

class Productoffers extends StatefulWidget {
 // const Productoffers({super.key});

  @override
  State<Productoffers> createState() => _ProductoffersState();
}

class _ProductoffersState extends State<Productoffers> {
  var product_list =[{

    "name" :"Pumps" ,
    "photo": "assets/new4.jpg",
    "MRP": "345",
    "New_Price" : "34",
    "details": "A submersible pump is fitted with watertight seals and gaskets. This type of sealed structure prevents the leakage of fluid from the submersible pump. The internal components of the pump remain completely sealed which eliminates any possibility of electrical accident,  pump is not noisy when the motor is running since the pump remains submerged. Therefore, the sound is muffled to some extent by the water or any other liquid wherein the pump remains."
        "The materials used for the manufacturing of a submersible pump are capable of resisting corrosion. The hermetic sealing of the pump also prevents exposure to corrosive material or oxidation.The convenient placement of a submersible pump increases its efficiency since it remains submerged in water. Therefore, this type of pumping device can quickly and efficiently transfer the fluid.The submersible pumps are low-maintenance pumping devices because of their design and where they are installed. There is no need for priming and there is no possibility of damage to the internal components resulting from the exposure to foreign elements due to hermetic sealing of submersible pumps. Therefore, this type of pumping device can be maintained easily and economically."
        "The submersible pumps are low-maintenance pumping devices because of their design and where they are installed. There is no need for priming and there is no possibility of damage to the internal components resulting from the exposure to foreign elements due to hermetic sealing of submersible pumps. Therefore, this type of pumping device can be maintained easily and economically.",
    "brand": "Brand x",
    "condition" : "New"
  },
    {
      "name" :"Iron" ,
      "photo": "assets/iron2.jpg" ,
      "MRP": "345",
      "New_Price" : "34",
      "details" : "A clothes iron (also flatiron, smoothing iron, or simply iron) is a small appliance that, when heated, is used to press clothes to remove wrinkles and unwanted creases. Domestic irons generally range in operating temperature from between 121 °C (250 °F) to 182 °C (360 °F). It is named for the metal (iron) of which the device was historically made, and the use of it is generally called ironing, the final step in the process of laundering clothes."

    "Ironing works by loosening the ties between the long chains of molecules that exist in polymer fiber materials. With the heat and the weight of the ironing plate, the fibers are stretched and the fabric maintains its new shape when cool. Some materials, such as cotton, require the use of water to loosen the intermolecular bonds."
      ,
      "brand": "Brand Y",
      "condition" : "Refurnished"
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
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestofferProductDetails(
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
                   style: TextStyle( color: Colors.grey , fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),

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

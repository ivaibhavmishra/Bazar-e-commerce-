import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Product{
  static const NAME  ="Product_Name";
  static const PRICE = "Price";
  static const IMAGE ="Image1";
  static const QUANTITY ="Quantity";
  static const BRAND ="Brand";
  static const CATEGORY ="Category";
  static const BESTOFFER = "Best_Offer";
  static const OURPREMIUM= "Our_premium";

  late String _Product_Name ;
  late String _brand;
  late String _image;
  late double  _Price;
  late int _quantity;
  late String _category;
  late bool _best_offer;
  late bool _our_premium;

  String get Product_Name => _Product_Name;
  String get Brand => _brand;
  String get Image1 => _image;
  String get Category => _category;
  double get Price => _Price;
  int get Quantity => _quantity;
  bool get Best_Offer => _best_offer;
  bool get Our_premium => _our_premium;


  Product.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data as Map;
    _Product_Name = data["Product_Name"];
    _brand= data["Brand"];
    _image= data["Image1"];
    _category = data["Category"];
    _Price = data["Price"];
    _quantity= data["Quantity"];
  }

}
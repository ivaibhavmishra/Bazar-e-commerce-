import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_project/Product.dart';
import 'dart:async';

class ProductsService{
  final CollectionReference _firestore = FirebaseFirestore.instance.collection("Brands");
  String collection = 'Product detail';
  Future<List<Product>> getOur_premium() =>
      _firestore.where('Our_premium', isEqualTo: true).get().then((snap){
        List<Product> premiumProducts =[];
         snap.docs.map((snapshot) => premiumProducts.add(Product.fromSnapshot(snapshot)));
         return premiumProducts;
      });
}


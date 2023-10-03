import 'package:flutter/material.dart';
import 'package:second_project/products.dart';

import 'Product.dart';
class AppProvider with ChangeNotifier{
  List<Product> _premiumProducts =[];
  ProductsService _productServices = ProductsService();
  AppProvider(){
    _getpremiumProducts();
  }

  List<Product> get premiumProducts => _premiumProducts;

  void _getpremiumProducts() async{
  _premiumProducts = await _productServices.getOur_premium();
  notifyListeners();
}
}
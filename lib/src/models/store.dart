import 'package:RenoRun_AngularDart/src/models/product.dart';

class Store { 
  List<Product> products;

  Store({this.products});

  /* 
    Accepts a list of product and adds each product into a list instance variable
   */
  Store.fromJson(listOfProducts) {
    products = new List<Product>();
    listOfProducts.forEach((product) {
        products.add(new Product.fromJson(product));
    });
  }
}

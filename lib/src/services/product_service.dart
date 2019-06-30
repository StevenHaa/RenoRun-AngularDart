import 'dart:convert';

import 'package:RenoRun_AngularDart/src/models/store.dart';
import 'package:http/http.dart' as http;

class ProductService {
    Store store;
    var url = "http://localhost:5000/products";

   Future<Store> fetchProductData() async {
        var res = await http.get(url);
        var listOfProducts = jsonDecode(res.body);
        // a store contains a list of products
        store = Store.fromJson(listOfProducts);
        return store;
    }
}
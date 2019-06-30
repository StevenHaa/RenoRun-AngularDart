import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService {
    var url = "http://localhost:5000/products";

   void fetchProductData() async {
        print("hello world");
        // getting the response
        var res = await http.get(url);

        var decodedJson = jsonDecode(res.body);

        print(decodedJson);
    }
}
import 'dart:convert';

import 'package:http/http.dart' as http;

class OrderService {
  var url = 'http://localhost:5000/orders';
  
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<void> postOrder(int productId, String email, String color) async {
    var body =  json.encode({
      'product_id': productId,
      'email': email,
      'color': color,
    });

    await http.post(url, body: body, headers: headers);
  }
}
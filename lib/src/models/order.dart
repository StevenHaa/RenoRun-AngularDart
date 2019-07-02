class Order { 
  String email;
  String colour;
  int productId;
  
  Order.empty() {
    this.email = "";
    this.colour = "";
    this.productId = 0;
  }

  Order(String email, String colour, int productId) { 
    this.email = email;
    this.colour = colour;
    this.productId = productId;
  }

  String toString() {
    return '$email, $colour $productId';
  }
}
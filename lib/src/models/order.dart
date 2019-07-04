class Order { 
  String email;
  String color;
  int productId;
  
  Order.empty() {
    this.email = '';
    this.color = '';
    this.productId = 0;
  }

  Order(String email, String color, int productId) { 
    this.email = email;
    this.color = color;
    this.productId = productId;
  }

  String toString() {
    return '$email, $color $productId';
  }
}
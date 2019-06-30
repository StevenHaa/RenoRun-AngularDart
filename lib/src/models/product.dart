
class Product { 
  String description;
  String name;
  double price;
  int productId;


  Product(String description, String name, double price, int productId) { 
    this.description = description;
    this.name = name;
    this.price = price;
    this.productId = productId;
  }

  // A constructor for a product in JSON format
  Product.fromJson(Map<String, dynamic> jsonProduct){
    this.description = jsonProduct["description"];
    this.name = jsonProduct["name"];
    this.price = jsonProduct["price"].toDouble();
    this.productId = jsonProduct["product_id"];
  }

  String get getDescription{
    return description;
  }

  String get getName {
    return name;
  }

  double get getPrice {
    return price;
  }

  int get getProductId{
    return productId;
  }

  void set setDescription(String newDescription){
    description = newDescription;
  }

  void set setName(String newName){ 
    name = newName;
  }

  void set setPrice(double newPrice){ 
    price = newPrice;
  }
  void set setProductId(int newProductId){ 
    productId = newProductId;
  }
}
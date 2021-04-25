class Product {
  String name;
  String price;
  int id;

  Product({this.name, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['id'] = this.id;
    return data;
  }
}
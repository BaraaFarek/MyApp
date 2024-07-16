class Products {
  int? id;
  String? name;
  int? price;
  String? description;
  String? images;
  int? categoryId;
  int? commission;
  int? sellerId;

  Products(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.images,
      this.categoryId,
      this.commission,
      this.sellerId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    images = json['images'];
    categoryId = json['category_id'];
    commission = json['commission'];
    sellerId = json['seller_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['images'] = this.images;
    data['category_id'] = this.categoryId;
    data['commission'] = this.commission;
    data['seller_id'] = this.sellerId;
    return data;
  }
}

class Products {
  List<Products>? products;

  Products({this.products});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

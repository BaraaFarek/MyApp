class StoresByCategories {
  int id;
  String name;
  String address;
  int phone;
  String facebookLink;
  String instagramLink;
  String rating;
  String imageStore;
  int sellerId;
  int productId;
  int externalServiceId;
  int categoryId;
  String type;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  StoresByCategories({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.facebookLink,
    required this.instagramLink,
    required this.rating,
    required this.imageStore,
    required this.sellerId,
    required this.productId,
    required this.externalServiceId,
    required this.categoryId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
  factory StoresByCategories.fromJson(Map<String, dynamic> json) {
    return StoresByCategories(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      facebookLink: json['facebook_link'],
      instagramLink: json['instagram_link'],
      rating: json['rating'],
      imageStore: json['image_store'],
      sellerId: json['seller_id'],
      productId: json['product_id'],
      externalServiceId: json['external_service_id'],
      categoryId: json['category_id'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: DateTime.parse(json['deletedAt']),
    );
  }
}

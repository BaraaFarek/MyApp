class StoresModel {
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
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  StoresModel({
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
    this.deletedAt,
  });

  factory StoresModel.fromJson(Map<String, dynamic> json) {
    return StoresModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? 0,
      facebookLink: json['facebookLink'] ?? '',
      instagramLink: json['instagramLink'] ?? '',
      rating: json['rating'] ?? '',
      imageStore: json['imageStore'] ?? '',
      sellerId: json['sellerId'] ?? 0,
      productId: json['productId'] ?? 0,
      externalServiceId: json['externalServiceId'] ?? 0,
      categoryId: json['categoryId'] ?? 0,
      type: json['type'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? '1970-01-01T00:00:00.000Z'),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? '1970-01-01T00:00:00.000Z'),
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }
}

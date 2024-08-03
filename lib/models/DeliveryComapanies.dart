class DeliveryCompaniesModel {
  int id;
  String name;
  String phone;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  DeliveryCompaniesModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeliveryCompaniesModel.fromJson(Map<String, dynamic> json) {
    return DeliveryCompaniesModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

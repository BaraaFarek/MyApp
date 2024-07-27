class Deliverycomapanies {
  final int id;
  final String name;
  final String phone;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Deliverycomapanies({
    required this.id,
    required this.name,
    required this.phone,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Deliverycomapanies.fromJson(Map<String, dynamic> json) {
    return Deliverycomapanies(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class AddOrderModel {
  String quantity;
  String description;
  int salesRate;
  int deliveryPrice;
  double deliveryDistance;
  String startingLocation;
  String deliveryLocation;
  String deliveryCompanyId;
  int customerId;
  String productId;
  dynamic externalServiceId;
  int price;
  int storeId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  AddOrderModel({
    required this.quantity,
    required this.description,
    required this.salesRate,
    required this.deliveryPrice,
    required this.deliveryDistance,
    required this.startingLocation,
    required this.deliveryLocation,
    required this.deliveryCompanyId,
    required this.customerId,
    required this.productId,
    required this.externalServiceId,
    required this.price,
    required this.storeId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      quantity: json['quantity'],
      description: json['description'],
      salesRate: json['salesRate'],
      deliveryPrice: json['deliveryPrice'],
      deliveryDistance: json['deliveryDistance'],
      startingLocation: json['startingLocation'],
      deliveryLocation: json['deliveryLocation'],
      deliveryCompanyId: json['deliveryCompanyId'],
      customerId: json['customerId'],
      productId: json['productId'],
      externalServiceId: json['externalServiceId'],
      price: json['price'],
      storeId: json['storeId'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      id: json['id'],
    );
  }
}

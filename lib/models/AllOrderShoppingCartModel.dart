class AllOrderShoppingCartModel {
  int id;
  String quantity;
  String price;
  String description;
  String salesRate;
  String deliveryPrice;
  String startingLocation;
  String deliveryLocation;
  String deliveryDistance;
  int deliveryCompanyId;
  int customerId;
  int productId;
  dynamic externalServiceId;
  int storeId;
  DateTime createdAt;
  DateTime updatedAt;

  AllOrderShoppingCartModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.description,
    required this.salesRate,
    required this.deliveryPrice,
    required this.startingLocation,
    required this.deliveryLocation,
    required this.deliveryDistance,
    required this.deliveryCompanyId,
    required this.customerId,
    required this.productId,
    required this.externalServiceId,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
  });
  factory AllOrderShoppingCartModel.fromJson(Map<String, dynamic> json) {
    return AllOrderShoppingCartModel(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      salesRate: json['salesRate'],
      deliveryPrice: json['deliveryPrice'],
      startingLocation: json['startingLocation'],
      deliveryLocation: json['deliveryLocation'],
      deliveryDistance: json['deliveryDistance'],
      deliveryCompanyId: json['deliveryCompanyId'],
      customerId: json['customerId'],
      productId: json['productId'],
      externalServiceId: json['externalServiceId'],
      storeId: json['storeId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

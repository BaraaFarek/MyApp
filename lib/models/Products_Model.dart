class ProductsModel {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  ProductsModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });
}

class Datum {
  int id;
  String name;
  String price;
  String discount;
  String description;
  int categoryId;
  int sellerId;
  String status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.description,
    required this.categoryId,
    required this.sellerId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });
}

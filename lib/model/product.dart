class ProductModel {
  ProductModel({
    required this.data,
  });

  final List<Datum> data;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.sellingPrice,
    required this.totalSaving,
    required this.description,
    required this.image,
  });

  final int? id;
  final String? name;
  final int? price;
  final bool? discount;
  final int? sellingPrice;
  final int? totalSaving;
  final String? description;
  final String? image;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      discount: json["discount"],
      sellingPrice: json["sellingPrice"],
      totalSaving: json["totalSaving"],
      description: json["description"],
      image: json["image"],
    );
  }
}

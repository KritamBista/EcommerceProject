class CategoriesModel {
  CategoriesModel({
    required this.data,
  });

  final List<Datum> data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
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
    required this.slug,
    required this.image,
    required this.products,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final List<Product> products;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      image: json["image"],
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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

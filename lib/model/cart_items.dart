class CartItemModel {
  CartItemModel({
    required this.data,
  });

  final List<Datum> data;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.productId,
    required this.product,
    required this.qty,
    required this.price,
    required this.amount,
    required this.image,
  });

  final int? id;
  final int? productId;
  final String? product;
  final int? qty;
  final int? price;
  final int? amount;
  final String? image;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      productId: json["product_id"],
      product: json["product"],
      qty: json["qty"],
      price: json["price"],
      amount: json["amount"],
      image: json["image"],
    );
  }
}

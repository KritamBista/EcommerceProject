class ProductDetailModel {
    ProductDetailModel({
        required this.data,
    });

    final Data? data;

    factory ProductDetailModel.fromJson(Map<String, dynamic> json){ 
        return ProductDetailModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
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

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
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

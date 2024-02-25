class OrderModel {
    OrderModel({
        required this.data,
    });

    final Data? data;

    factory OrderModel.fromJson(Map<String, dynamic> json){ 
        return OrderModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            success: json["success"],
            message: json["message"],
        );
    }

}

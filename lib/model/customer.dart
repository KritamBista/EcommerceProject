class CustomerDetailModel {
    CustomerDetailModel({
        required this.data,
    });

    final Data? data;

    factory CustomerDetailModel.fromJson(Map<String, dynamic> json){ 
        return CustomerDetailModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.name,
        required this.email,
    });

    final String? name;
    final String? email;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            name: json["name"],
            email: json["email"],
        );
    }

}

class LoginModel {
    LoginModel({
        required this.data,
    });

    final Data? data;

    factory LoginModel.fromJson(Map<String, dynamic> json){ 
        return LoginModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data { 
    Data({
        required this.token,
        required this.user,
    });

    final String? token;
    final User? user;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            token: json["token"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
        );
    }

}

class User {
    User({
        required this.name,
        required this.email,
    });

    final String? name;
    final String? email;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            name: json["name"],
            email: json["email"],
        );
    }

}

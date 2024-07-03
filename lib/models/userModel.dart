import 'dart:convert';

class UserModel {
  final Location location;
  final String id;
  final String name;
  final String phone;
  final String email;
  final List<dynamic> favorites;
  final DateTime createdAt;

  UserModel({
    required this.location,
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.favorites,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      location: Location.fromJson(json['location']),
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      favorites: List<dynamic>.from(json['favorites']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'favorites': favorites,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}

void main() {
  String jsonString = '''
  {
    "user": {
        "location": {
            "type": "Point",
            "coordinates": [
                31.224779,
                30.1572709
            ]
        },
        "_id": "668516544ac268bd35bf4e0a",
        "name": "fady rg",
        "phone": "01153348583",
        "email": "testemfa052@gmail.com",
        "favorites": [],
        "createdAt": "2024-07-03T09:13:58.263Z"
    }
  }
  ''';

  Map<String, dynamic> userMap = jsonDecode(jsonString)['user'];
  UserModel userModel = UserModel.fromJson(userMap);

  print('Name: ${userModel.name}');
  print('Location: ${userModel.location.coordinates}');
  print('Email: ${userModel.email}');
}


import 'dart:convert';

List<Alldetails> alldetailsFromJson(String str) =>
    List<Alldetails>.from(json.decode(str).map((x) => Alldetails.fromJson(x)));

String alldetailsToJson(List<Alldetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Alldetails {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? gender;
  String? description;
  dynamic createdAt;
  dynamic updatedAt;

  Alldetails({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.gender,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Alldetails.fromJson(Map<String, dynamic> json) => Alldetails(
    id: json["id"] ?? 0, // Default to 0 if null
    name: json["name"] ?? "Unknown", // Default value
    phone: json["phone"] ?? "N/A", // Default value
    email: json["email"] ?? "N/A",
    address: json["address"] ?? "N/A",
    gender: json["gender"] ?? "N/A",
    description: json["description"] ?? "N/A",
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "gender": gender,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

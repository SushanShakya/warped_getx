// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserResponseModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;

  const UserResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
  });

  factory UserResponseModel.fromRawJson(String str) =>
      UserResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
      };

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      maidenName,
      age,
      gender,
      email,
      phone,
    ];
  }
}

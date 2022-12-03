// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String email;
  final String firstName;
  final int id;
  final String? image;
  final String token;

  const LoginResponseModel({
    required this.email,
    required this.firstName,
    required this.id,
    this.image,
    required this.token,
  });
  const LoginResponseModel.fake({
    this.email = 'someone@something.com',
    this.firstName = 'Sushan',
    this.id = 1,
    this.image,
    this.token = "somethign",
  });

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "id": id,
        "image": image,
        "token": token,
      };

  @override
  List<Object?> get props {
    return [
      email,
      firstName,
      id,
      image,
      token,
    ];
  }

  @override
  bool get stringify => true;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String email;
  final String firstName;
  final String gender;
  final int id;
  final String? image;
  final String lastName;
  final String token;
  final String username;

  const LoginResponseModel({
    required this.email,
    required this.firstName,
    required this.gender,
    required this.id,
    this.image,
    required this.lastName,
    required this.token,
    required this.username,
  });
  const LoginResponseModel.fake({
    this.email = 'someone@something.com',
    this.firstName = 'Sushan',
    this.gender = "Male",
    this.id = 1,
    this.image,
    this.lastName = "Shakya",
    this.token = "somethign",
    this.username = "sushan",
  });

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        email: json["email"],
        firstName: json["firstName"],
        gender: json["gender"],
        id: json["id"],
        image: json["image"],
        lastName: json["lastName"],
        token: json["token"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "gender": gender,
        "id": id,
        "image": image,
        "lastName": lastName,
        "token": token,
        "username": username,
      };

  @override
  String toString() {
    return 'LoginResponseModel(email: $email, firstName: $firstName, gender: $gender, id: $id, image: $image, lastName: $lastName, token: $token, username: $username)';
  }

  @override
  List<Object?> get props {
    return [
      email,
      firstName,
      gender,
      id,
      image,
      lastName,
      token,
      username,
    ];
  }
}

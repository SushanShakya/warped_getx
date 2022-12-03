// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String? image;
  final String phone;
  final String email;

  const UserEntity({
    required this.id,
    required this.name,
    this.image,
    required this.phone,
    required this.email,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      phone,
      email,
    ];
  }
}

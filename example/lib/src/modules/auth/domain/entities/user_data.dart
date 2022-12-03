import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? image;
  const UserData({
    required this.id,
    required this.name,
    required this.email,
    this.image,
  });

  const UserData.fake({
    this.id = '1',
    this.name = 'Hello',
    this.email = 'someone@something.com',
    this.image,
  });

  UserData copyWith({
    String? id,
    String? name,
    String? email,
    String? image,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, email, image];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:example/src/modules/auth/domain/entities/user_data.dart';

class LoginResponse extends Equatable {
  final String token;
  final UserData user;

  const LoginResponse({
    required this.token,
    required this.user,
  });

  const LoginResponse.fake({
    this.token = 'asd',
    this.user = const UserData.fake(),
  });

  @override
  List<Object> get props => [token, user];
}

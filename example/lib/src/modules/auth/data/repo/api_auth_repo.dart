import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example/src/modules/auth/data/models/login_response_model.dart';
import 'package:example/src/modules/auth/data/repo/interface/auth_repo.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';
import 'package:warped_getx/warped_getx.dart';

class ApiAuthRepo implements AuthRepo {
  final Dio dio;

  ApiAuthRepo({required this.dio});

  @override
  Future<LoginResponseModel> login(LoginParam param) async {
    try {
      final res = await dio.post('/auth/login', data: {
        'username': param.username,
        'password': param.password,
      });
      if (res.data == null) throw const ServerError();
      print(res.data);
      return LoginResponseModel.fromJson(res.data);
    } catch (e) {
      log(e.toString());
      throw const ServerError();
    }
  }
}

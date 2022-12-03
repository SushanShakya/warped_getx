// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/src/core/errors/storage_error.dart';
import 'package:example/src/core/interfaces/usecases.dart';
import 'package:example/src/modules/auth/data/repo/interface/auth_repo.dart';
import 'package:example/src/modules/auth/data/repo/interface/auth_store_repo.dart';
import 'package:example/src/modules/auth/domain/converters/login_response_converter.dart';
import 'package:example/src/modules/auth/domain/entities/login_response.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';

class LoginInteractor extends Usecase<LoginResponse, LoginParam> {
  final AuthRepo repo;
  final AuthStoreRepo storeRepo;

  LoginInteractor({
    required this.repo,
    required this.storeRepo,
  });

  @override
  Future<LoginResponse> call(LoginParam param) async {
    final data = await repo.login(param);
    try {
      await storeRepo.storeToken(data.token);
    } catch (e) {
      throw const StorageError();
    }
    return LoginResponseConverter.fromModel(data).data;
  }
}

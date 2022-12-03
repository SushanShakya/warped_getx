import 'package:example/src/modules/auth/data/models/login_response_model.dart';

import '../../../domain/entities/params/login_param.dart';

abstract class AuthRepo {
  Future<LoginResponseModel> login(LoginParam param);
}

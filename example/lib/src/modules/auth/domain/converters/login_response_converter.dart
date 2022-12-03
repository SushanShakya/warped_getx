import 'package:example/src/core/interfaces/converter.dart';
import 'package:example/src/modules/auth/data/models/login_response_model.dart';
import 'package:example/src/modules/auth/domain/entities/login_response.dart';
import 'package:example/src/modules/auth/domain/entities/user_data.dart';

class LoginResponseConverter extends BaseConverter<LoginResponse> {
  LoginResponseConverter.fromModel(LoginResponseModel model) {
    data = LoginResponse(
      token: model.token,
      user: UserData(
        id: model.id.toString(),
        name: model.firstName,
        email: model.email,
      ),
    );
  }
}

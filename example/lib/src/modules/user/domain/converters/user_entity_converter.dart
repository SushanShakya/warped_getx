import 'package:example/src/core/interfaces/converter.dart';
import 'package:example/src/modules/user/domain/entities/user_entity.dart';

import '../../data/models/user_response_model.dart';

class UserEntityConverter extends BaseConverter<UserEntity> {
  UserEntityConverter.fromModel(UserResponseModel user) {
    data = UserEntity(
      id: user.id.toString(),
      name: user.firstName,
      phone: user.phone,
      email: user.email,
    );
  }
}

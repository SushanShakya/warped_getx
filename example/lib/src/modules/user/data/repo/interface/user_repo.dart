import 'package:example/src/modules/user/data/models/user_response_model.dart';

import '../../../../common/domain/entities/paginated.dart';

abstract class UserRepo {
  Future<Paginated<List<UserResponseModel>>> fetchUsers(
    int page, {
    int limit = 10,
  });
}

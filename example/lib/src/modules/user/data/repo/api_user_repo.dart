// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:example/src/modules/common/domain/entities/pagination_info.dart';
import 'package:example/src/modules/user/data/models/user_response_model.dart';
import 'package:example/src/modules/common/domain/entities/paginated.dart';
import 'package:example/src/modules/user/data/repo/interface/user_repo.dart';
import 'package:warped_getx/warped_getx.dart';

class ApiUserRepo implements UserRepo {
  final Dio dio;
  ApiUserRepo({
    required this.dio,
  });

  @override
  Future<Paginated<List<UserResponseModel>>> fetchUsers(
    int page, {
    int limit = 10,
  }) async {
    try {
      final res = await dio.get('/users?skip=${page - 1}&limit=$limit');
      final data = res.data;
      if (data == null) throw const ServerError();
      return Paginated(
        info: PaginationInfo(
          total: data['total'],
          page: (data['skip'] as int) + 1,
          limit: data['limit'],
        ),
        data: List<UserResponseModel>.from(
          data['users'].map((e) => UserResponseModel.fromJson(e)),
        ),
      );
    } on ServerError {
      rethrow;
    } catch (e) {
      throw const ServerError();
    }
  }
}

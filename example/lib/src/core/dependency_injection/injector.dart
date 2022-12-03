import 'package:dio/dio.dart';
import 'package:example/src/core/res/strings.dart';
import 'package:example/src/modules/auth/data/repo/api_auth_repo.dart';
import 'package:example/src/modules/auth/data/repo/memory_auth_store_repo.dart';
import 'package:example/src/modules/auth/domain/usecases/login_interactor.dart';
import 'package:example/src/modules/auth/gui/presenters/login_ctrl.dart';
import 'package:example/src/modules/user/data/repo/api_user_repo.dart';
import 'package:example/src/modules/user/domain/usecases/fetch_users_interactor.dart';
import 'package:example/src/modules/user/gui/presenters/users_ctrl.dart';
import 'package:get_it/get_it.dart';

final g = GetIt.I;

void injectDependencies() {
  // Repos
  g.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: url,
        headers: {"Content-Type": "application/json"},
      ),
    ),
  );
  g.registerLazySingleton(() => ApiAuthRepo(dio: g<Dio>()));
  g.registerLazySingleton(() => ApiUserRepo(dio: g<Dio>()));
  g.registerLazySingleton(() => MemoryAuthStoreRepo());

  // Usecases
  g.registerLazySingleton(
    () => LoginInteractor(
      repo: g<ApiAuthRepo>(),
      storeRepo: g<MemoryAuthStoreRepo>(),
    ),
  );

  g.registerLazySingleton(() => FetchUsersInteractor(repo: g<ApiUserRepo>()));

  // Factories
  g.registerFactory(() => LoginCtrl(interactor: g<LoginInteractor>()));
  g.registerFactory(() => UsersCtrl(interactor: g<FetchUsersInteractor>()));
}

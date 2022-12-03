import 'package:example/src/modules/auth/domain/entities/login_response.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';
import 'package:example/src/modules/auth/domain/usecases/login_interactor.dart';
import 'package:example/src/modules/auth/gui/presenters/login_ctrl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:warped_getx/warped_getx.dart';

import 'login_ctrl_test.mocks.dart';

@GenerateMocks([LoginInteractor])
void main() {
  group('LoginCtrl', () {
    late LoginInteractor interactor;
    late LoginCtrl ctrl;

    var param = const LoginParam(
      username: "username",
      password: "password",
    );

    var mockResponse = const LoginResponse.fake();

    setUp(() {
      interactor = MockLoginInteractor();
      ctrl = LoginCtrl(interactor: interactor);
    });

    test('is a AsyncController', () {
      expect(ctrl, isA<AsyncController>());
    });

    group('stubbed', () {
      setUp(() {
        when(interactor.call(param)).thenAnswer((e) async => mockResponse);
      });

      test('calls interactor when login', () {
        ctrl.login(param);
        verify(interactor.call(param));
      });
    });
  });
}

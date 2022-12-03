part of 'controllers.dart';

abstract class WarpedController extends GetxController {
  late Rx<BaseState> state;

  WarpedController() {
    state = Rx(InitialState());
  }

  void emit(BaseState state) {
    this.state(state);
  }
}

part of 'controllers.dart';

abstract class SyncController extends WarpedController {
  void handleDefaultStates(void Function() callback) {
    try {
      callback();
    } on Failure catch (e) {
      emit(ErrorState(message: e.message));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}

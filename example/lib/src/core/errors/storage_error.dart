import 'package:warped_getx/warped_getx.dart';

class StorageError extends Failure {
  const StorageError({String message = "Storage Failed"})
      : super(message: message);
}

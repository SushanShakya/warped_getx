part of 'failure.dart';

class ServerError extends Failure {
  const ServerError({String message = "Server Error Occured"})
      : super(message: message);
}

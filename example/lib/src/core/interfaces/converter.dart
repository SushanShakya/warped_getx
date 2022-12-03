// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class BaseConverter<T> extends Equatable {
  late T data;

  @override
  List<Object?> get props => [data];
}

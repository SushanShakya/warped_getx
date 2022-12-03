// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:example/src/modules/common/domain/entities/pagination_info.dart';

class Paginated<T> extends Equatable {
  final PaginationInfo info;
  final T data;

  const Paginated({
    required this.info,
    required this.data,
  });

  @override
  List<Object?> get props => [info, data];
}

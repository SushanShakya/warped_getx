// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:warped_getx/warped_getx.dart';

import 'package:example/src/modules/common/domain/entities/pagination_info.dart';

abstract class PaginatedCtrl<T> extends AsyncController {
  late PaginationInfo info;
  late List<T> data;
  PaginatedCtrl() {
    data = [];
    reset();
  }

  reset() {
    info = const PaginationInfo.init();
  }
}

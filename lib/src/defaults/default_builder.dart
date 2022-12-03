import 'package:flutter/material.dart';

import '../configs/configs.dart';
import '../states/states.dart';

/// D = Type of Data expected when you get Data
/// E = Type of Data expected in Error
Widget Function(BuildContext, BaseState) defaultBuilder<D, E>({
  Widget Function()? onLoading,
  required Widget Function(D state) onData,
  Widget Function(ErrorState<E> state)? onError,
  Widget Function()? otherwise,
}) =>
    (BuildContext context, BaseState state) {
      if (state is LoadingState) {
        return (onLoading != null)
            ? onLoading()
            : DefaultBuilderConfig.onLoading();
      }
      if (state is DataState<D>) {
        return onData(state.data);
      }
      if (state is ErrorState<E>) {
        return (onError != null)
            ? onError(state)
            : DefaultBuilderConfig.onError<E>(state);
      }
      return (otherwise != null) ? otherwise() : Container();
    };

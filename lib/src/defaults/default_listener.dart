import 'package:flutter/material.dart';
import 'package:warped_getx/src/states/states.dart';

import '../configs/configs.dart';

/// D = Type of Data expected when you get Data
/// E = Type of Data expected in Error
void Function(BuildContext, BaseState) defaultListener<D, E>({
  void Function(BuildContext context)? onLoading,
  void Function(BuildContext context, D data)? onData,
  void Function(BuildContext context, ErrorState<E> state)? onError,
  void Function(BuildContext context)? onStateChange,
}) =>
    (BuildContext context, BaseState state) {
      if (state is LoadingState) {
        return (onLoading != null)
            ? onLoading(context)
            : DefaultListenerConfig.onLoading(context);
      }
      (onStateChange != null)
          ? onStateChange(context)
          : DefaultListenerConfig.onStateChange(context);
      if (state is DataState<D>) {
        return (onData != null)
            ? onData(context, state.data)
            : DefaultListenerConfig.onData<D>(context, state.data);
      }
      if (state is ErrorState<E>) {
        return (onError != null)
            ? onError(context, state)
            : DefaultListenerConfig.onError<E>(context, state);
      }
    };

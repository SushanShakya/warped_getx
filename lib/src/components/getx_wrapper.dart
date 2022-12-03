// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'component.dart';

enum WrapperType { listener, builder, consumer, unknown }

class GetXWrapper<T extends WarpedController> extends StatefulWidget {
  final T controller;
  final void Function(BuildContext context, BaseState state)? listener;
  final Widget Function(BuildContext context, BaseState state)? builder;
  final Widget? child;

  const GetXWrapper({
    Key? key,
    required this.controller,
    this.listener,
    this.builder,
    this.child,
  })  : assert((builder != null) ||
            (builder != null && listener != null) ||
            (listener != null && child != null)),
        super(key: key);

  @override
  State<GetXWrapper<T>> createState() => _GetXWrapperState<T>();
}

class _GetXWrapperState<T extends WarpedController>
    extends State<GetXWrapper<T>> {
  late WrapperType _type;

  void inferTypes() {
    if (widget.builder != null && widget.listener != null) {
      _type = WrapperType.consumer;
    } else if (widget.listener != null && widget.child != null) {
      _type = WrapperType.listener;
    } else if (widget.builder != null) {
      _type = WrapperType.builder;
    } else {
      _type = WrapperType.unknown;
    }
  }

  @override
  void initState() {
    super.initState();
    inferTypes();
  }

  Widget buildComponent(BuildContext context) {
    switch (_type) {
      case WrapperType.builder:
        return GetXBuilder<T>(
          controller: widget.controller,
          builder: widget.builder!,
        );
      case WrapperType.listener:
        return GetXListener<T>(
          controller: widget.controller,
          listener: widget.listener!,
          child: widget.child!,
        );
      case WrapperType.consumer:
        return GetXConsumer<T>(
          controller: widget.controller,
          listener: widget.listener!,
          builder: widget.builder!,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildComponent(context);
  }
}

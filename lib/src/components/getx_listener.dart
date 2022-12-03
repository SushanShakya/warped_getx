// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'component.dart';

class GetXListener<T extends WarpedController> extends StatefulWidget {
  final T controller;
  final void Function(BuildContext context, BaseState state) listener;
  final Widget child;

  const GetXListener({
    Key? key,
    required this.controller,
    required this.listener,
    required this.child,
  }) : super(key: key);

  @override
  State<GetXListener<T>> createState() => _GetXListenerState<T>();
}

class _GetXListenerState<T extends WarpedController>
    extends State<GetXListener<T>> {
  late T _ctrl;

  late StreamSubscription<BaseState>? subscription;

  void _subscribe() {
    subscription = widget.controller.state.listen((state) {
      widget.listener(context, state);
    });
  }

  void _unsubscribe() {
    subscription?.cancel();
    subscription = null;
  }

  @override
  void initState() {
    super.initState();
    _ctrl = widget.controller;
    _subscribe();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_ctrl != widget.controller) {
      if (subscription != null) {
        _unsubscribe();
        _ctrl = widget.controller;
      }
      _subscribe();
    }
  }

  @override
  void didUpdateWidget(covariant GetXListener<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_ctrl != widget.controller) {
      if (subscription != null) {
        _unsubscribe();
        _ctrl = widget.controller;
      }
      _subscribe();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _unsubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

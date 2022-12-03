// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'component.dart';

class GetXBuilder<T extends WarpedController> extends StatelessWidget {
  final T controller;
  final Widget Function(BuildContext context, BaseState state) builder;

  const GetXBuilder({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.state.value;
      return builder(context, state);
    });
  }
}

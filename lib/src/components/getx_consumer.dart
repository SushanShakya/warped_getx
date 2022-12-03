// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'component.dart';

class GetXConsumer<T extends WarpedController> extends StatelessWidget {
  final T controller;
  final void Function(BuildContext context, BaseState state) listener;
  final Widget Function(BuildContext context, BaseState state) builder;

  const GetXConsumer({
    Key? key,
    required this.controller,
    required this.listener,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetXListener<T>(
      controller: controller,
      listener: listener,
      child: GetXBuilder<T>(
        controller: controller,
        builder: builder,
      ),
    );
  }
}

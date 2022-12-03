import 'package:example/src/modules/user/domain/entities/user_entity.dart';
import 'package:example/src/modules/user/gui/presenters/users_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:warped_getx/warped_getx.dart';

import '../../../../core/dependency_injection/injector.dart';

class UsersView extends StatefulWidget {
  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late UsersCtrl ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = g<UsersCtrl>()..fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GetXWrapper<UsersCtrl>(
          controller: ctrl,
          builder: defaultBuilder<List<UserEntity>, void>(
            onData: (data) => ListView.separated(
              itemCount: data.length,
              separatorBuilder: (c, i) => const SizedBox(height: 16),
              itemBuilder: (c, i) {
                var e = data[i];
                return ListTile(
                  leading: CircleAvatar(
                    child:
                        e.image == null ? Container() : Image.network(e.image!),
                  ),
                  title: Text(e.name),
                  subtitle: Text(e.phone),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

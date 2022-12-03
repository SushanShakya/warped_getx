import 'package:example/src/modules/auth/domain/entities/login_response.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';
import 'package:example/src/modules/auth/gui/presenters/login_ctrl.dart';
import 'package:example/src/modules/user/gui/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:warped_getx/warped_getx.dart';

import '../../../../core/dependency_injection/injector.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCtrl ctrl;
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    ctrl = g<LoginCtrl>();
    usernameCtrl = TextEditingController(text: 'atuny0');
    passwordCtrl = TextEditingController(text: '9uQFF1Lh');
    node = FocusNode();
  }

  void login() {
    final username = usernameCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    ctrl.login(LoginParam(username: username, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetXListener<LoginCtrl>(
          controller: ctrl,
          listener: defaultListener<LoginResponse, void>(
            onData: (context, data) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (c) => UsersView()),
              );
            },
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: usernameCtrl,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(node);
                        },
                        decoration: const InputDecoration(
                          labelText: "Username",
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordCtrl,
                        focusNode: node,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                      const SizedBox(height: 26),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: login,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Use :\nusername: atuny0,\npassword: 9uQFF1Lh',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

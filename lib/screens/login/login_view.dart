import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/screens/login/login_model.dart';
import '../../config.dart';
import 'dart:math';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginController controller =
        ref.read(providers.loginControllerProvider.notifier);
    final LoginModel model = ref.watch(providers.loginControllerProvider);
    List<String> pictures = [
      "assets/images/pizza.jpg",
    ];
    final random = Random();
    int index = random.nextInt(pictures.length);
    double width = MediaQuery.of(context).size.width;
    bool isWide = width > 600;
    double sidePadding = isWide ? width / 5 : 30;

    return Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 15, sidePadding, 30),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: isWide ? min(500, width / 2) : 250,
                      child: Image.asset(
                        pictures[index],
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 20, sidePadding, 15),
                child: TextField(
                  obscureText: false,
                  onChanged: (value) {
                    controller.setUsername(value);
                  },
                  decoration: InputDecoration(
                      labelText: FlutterI18n.translate(context, "login.email"),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 20, sidePadding, 15),
                child: TextField(
                  obscureText: !model.passwordVisible,
                  onChanged: (value) {
                    controller.setPassword(value);
                  },
                  onSubmitted: (_) => controller.loginWithMail(context),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          model.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: currentScheme.getScheme().primary,
                        ),
                        onPressed: () {
                          controller.pwVissible();
                        },
                      ),
                      labelText:
                          FlutterI18n.translate(context, "login.password"),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 20, sidePadding, 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: currentScheme
                                              .getScheme()
                                              .primary)))),
                      onPressed: () async {
                        controller.loginWithMail(context);
                      },
                      child:
                          Text(FlutterI18n.translate(context, "login.login"))),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ))),
                    onPressed: () => controller.addUser(context),
                    child: Text(FlutterI18n.translate(context, "login.signup")),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

abstract class LoginController extends StateNotifier<LoginModel> {
  LoginController(super.state);
  void loginWithMail(BuildContext context);
  void pwVissible();
  void setPassword(String password);
  void setUsername(String username);
  void addUser(BuildContext context);
}

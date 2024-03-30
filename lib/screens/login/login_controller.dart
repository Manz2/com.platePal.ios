import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:logger/logger.dart';
import 'package:plate_pal/screens/login/login_backend_service.dart';
import 'package:plate_pal/screens/login/login_model.dart';
import 'package:plate_pal/screens/login/login_view.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'package:plate_pal/ui-kit/error_dialog.dart';
import 'package:plate_pal/ui-kit/name_input_dialog.dart';

class LoginControllerImplmentation extends LoginController {
  final LoginBackendService _backendService;
  final MyAppNavigationService _navigationService;
  LoginControllerImplmentation(
      {LoginModel? model,
      required LoginBackendService backendService,
      required MyAppNavigationService navigationService})
      : _backendService = backendService,
        _navigationService = navigationService,
        super(model ??
            const LoginModel(
              password: '',
              username: '',
              passwordVisible: false,
            ));
  Logger logger = Logger();

  @override
  void loginWithMail(BuildContext context) async {
    bool usernameSet = false;
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: state.username, password: state.password);
      if (await _backendService.firstLogin(user.user!.uid)) {
        if (!context.mounted) return;
        await showDialog(
                context: context,
                builder: (context) => const NameInputController())
            .then((valueFromDialog) {
          if (valueFromDialog == "Abbruch") {
            FirebaseAuth.instance.signOut();
            return;
          } else {
            _backendService.createUser(user.user!.uid, valueFromDialog);
            usernameSet = true;
          }
        });
      } else {
        usernameSet = true;
      }
      if (usernameSet) {
        state =
            state.copyWith(username: "", password: "", passwordVisible: false);
        if (!context.mounted) return;
        _navigationService.routeHome(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        logger.e("Wrong password provided for that user.");
      }
      if (!context.mounted) return;
      ErrorDialog(
              title: FlutterI18n.translate(context, "error.signin.title"),
              message: FlutterI18n.translate(context, "error.signin.message"))
          .display(context);
    }
  }

  @override
  void pwVissible() {
    state = state.copyWith(passwordVisible: !state.passwordVisible);
  }

  @override
  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  @override
  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  @override
  Future<void> addUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.username,
        password: state.password,
      );
      if (!context.mounted) return;
      loginWithMail(context);
    } on FirebaseAuthException catch (e) {
      if (!checkError(e.message!, context)) {
        //fist check for web
        checkError(e.code, context);
        //seccon check for app
      }
    } catch (e) {
      logger.e(e);
    }
  }

  bool checkError(String e, BuildContext context) {
    if (e.contains("weak-password")) {
      ErrorDialog(
              title:
                  FlutterI18n.translate(context, "login.weak-password-title"),
              message:
                  FlutterI18n.translate(context, "login.weak-password-message"))
          .display(context);
      return true;
    } else if (e.contains("email-already-in-use")) {
      ErrorDialog(
              title: FlutterI18n.translate(
                  context, "login.email-already-in-use-title"),
              message: FlutterI18n.translate(
                  context, "login.email-already-in-use-message"))
          .display(context);
      return true;
    } else if (e.contains("invalid-email")) {
      ErrorDialog(
              title:
                  FlutterI18n.translate(context, "login.invalid-email-title"),
              message:
                  FlutterI18n.translate(context, "login.invalid-email-message"))
          .display(context);
      return true;
    } else {
      return false;
    }
  }
}

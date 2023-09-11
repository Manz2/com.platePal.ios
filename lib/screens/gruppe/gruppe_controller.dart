import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:plate_pal/screens/gruppe/gruppe_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_model.dart';
import 'package:plate_pal/screens/gruppe/gruppe_view.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'package:plate_pal/ui-kit/add_group_member.dart';

bool setup = true;

class GruppeControllerImplmentation extends GruppeController {
  final GruppeBackendService _backendService;
  final MyAppNavigationService _navigationService;
  GruppeControllerImplmentation({
    GruppeModel? model,
    required GruppeBackendService backendService,
    required MyAppNavigationService navigationService,
  })  : _backendService = backendService,
        _navigationService = navigationService,
        super(model ?? const GruppeModel(members: []));

  @override
  Future<void> getGroupMembers() async {
    if (setup) {
      GruppeServiceReturn groupReturn = await _backendService
          .getGroupMembers(FirebaseAuth.instance.currentUser!.uid);
      state = state.copyWith(members: groupReturn.members);
      setup = false;
    }
  }

  @override
  void setSetup() {
    setup = !setup;
  }

  @override
  void newMember(BuildContext context) async {
    await showDialog(
            context: context,
            builder: (context) => const AddGroupMemberController())
        .then((valueFromDialog) async {
      if (valueFromDialog == "Abbruch") {
        return;
      } else {
        await addMemberToGroup(
            valueFromDialog, ScaffoldMessenger.of(context),FlutterI18n.translate(context, "account.noAccountFound"));
      }
    });
  }

  Future<void> addMemberToGroup(valueFromDialog,
      ScaffoldMessengerState scaffoldMessenger,String failureText) async {
    final snackBar = SnackBar(
      content: Text(failureText),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    bool returnVal = await _backendService.addNewMember(
        valueFromDialog, FirebaseAuth.instance.currentUser!.uid);
    if (!returnVal) {
      scaffoldMessenger.showSnackBar(snackBar);
    } else {
      setup = true;
      getGroupMembers();
    }
  }

  @override
  void copyMyId(BuildContext context) {
    Clipboard.setData(
        ClipboardData(text: FirebaseAuth.instance.currentUser!.uid));
    final snackBar = SnackBar(
      content: Text(FlutterI18n.translate(context, "account.idCopied")),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Future<void> removeMember(String id, BuildContext context) async {
    final snackBar = SnackBar(
      content: Text(FlutterI18n.translate(context, "account.memberRemoved")),
      action: SnackBarAction(
          label: 'undo',
          onPressed: () async {
            await _backendService.addNewMember(
                id, FirebaseAuth.instance.currentUser!.uid);
            setup = true;
            getGroupMembers();
          }),
    );
    bool returnVal = await _backendService.removeMember(
        id, FirebaseAuth.instance.currentUser!.uid);
    if (returnVal) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setup = true;
      getGroupMembers();
    }
  }

  @override
  void navigateAccount(BuildContext context) {
    _navigationService.routeAccount(context);
  }

  @override
  Future<void> pasteIdQuickly(ScaffoldMessengerState scaffoldMessengerState,String failureText) async {
    ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    if (cdata != null) {
      addMemberToGroup(cdata.text,scaffoldMessengerState,failureText);
    }
  }
}

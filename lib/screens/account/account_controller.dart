import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/account/account_backend_service.dart';
import 'package:plate_pal/screens/account/account_model.dart';
import 'package:plate_pal/screens/account/account_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';

bool setup = false;
bool setup2 = false;
Logger logger = Logger();

class AccountControllerImplmentation extends AccountController {
  final AccountBackendService _backendService;
  final MyAppNavigationService _navigationService;
  AccountControllerImplmentation(
      {AccountModel? model,
      required AccountBackendService backendService,
      required MyAppNavigationService navigationService})
      : _backendService = backendService,
        _navigationService = navigationService,
        super(model ??
            AccountModel(name: "", image: "", fontSize: currentFontSize));

  @override
  Future<void> init() async {
    await getUsername();
    await getUserImage();
  }

  @override
  Future<void> getUsername() async {
    if (!setup || state.name == "") {
      AccountServiceReturn user = await _backendService
          .getUserName(FirebaseAuth.instance.currentUser!.uid);
      state = state.copyWith(name: user.name);
      setup = true;
    }
  }

  @override
  Future<void> getUserImage() async {
    if (!setup2) {
      String url = await _backendService.getUserImage(
          userId: FirebaseAuth.instance.currentUser!.uid);
      if (url != "") {
        final storageRef = FirebaseStorage.instance.ref("userImages");
        state =
            state.copyWith(image: await storageRef.child(url).getDownloadURL());
        setup2 = true;
      }
    }
  }

  @override
  Future<bool> changeImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(withData: true, allowMultiple: false, type: FileType.image);

    if (result != null) {
      if (result.files.single.size >= 2000000) {
        return false;
      }
      String cp = await _backendService.getUserImage(
          userId: FirebaseAuth.instance.currentUser!.uid);
      state = state.copyWith(image: "");
      if (cp != "") {
        await FirebaseStorage.instance.ref("userImages").child(cp).delete();
      }

      Uint8List uploadfile = result.files.single.bytes!;
      String extension = result.files.single.extension!;
      String fileName = "${FirebaseAuth.instance.currentUser!.uid}.$extension";
      await FirebaseStorage.instance
          .ref("userImages")
          .child(fileName)
          .putData(uploadfile);
      await _backendService.setUserImage(
          uid: FirebaseAuth.instance.currentUser!.uid, imageString: fileName);

      setup2 = false;
      getUserImage();
      return true;
    } else {
      logger.d("Failed to get Image");
      return false;
    }
  }

  @override
  void logout(context) {
    FirebaseAuth.instance.signOut();
    setup = false;
    setup2 = false;
    _navigationService.routeLogin(context);
  }

  @override
  void setFontSize(int fontSize) {
    prefs.setInt('fontSize', fontSize);
    currentFontSize = fontSize;
    state = state.copyWith(fontSize: fontSize);
  }

  @override
  void navigateGroup(BuildContext context) {
    _navigationService.routeGroup(context);
  }

  @override
  void navigateHome(BuildContext context) {
    _navigationService.routeHome(context);
  }
}

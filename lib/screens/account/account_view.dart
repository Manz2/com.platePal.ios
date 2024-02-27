import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/ui-kit/button_list.dart';
import 'package:plate_pal/ui-kit/error_dialog.dart';
import 'account_model.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountController controller =
        ref.read(providers.accountControllerProvider.notifier);
    final AccountModel model = ref.watch(providers.accountControllerProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.init();
    });
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.navigateHome(context);
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                if (model.image == "null" || model.image == "") ...[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => controller.changeImage().then((value) => {
                          if (!value)
                            {
                              ErrorDialog(
                                      message: FlutterI18n.translate(
                                          context, "error.upload.message"),
                                      title: FlutterI18n.translate(
                                          context, "error.upload.title"))
                                  .display(context)
                            }
                        }),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const Icon(
                          size: 150,
                          Icons.account_circle_rounded,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: currentScheme.getScheme().surfaceVariant,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: currentScheme.getScheme().primary,
                                  width: 2),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.edit,
                              size: 22,
                              color: currentScheme.getScheme().primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ] else ...[
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => controller.changeImage().then((value) => {
                            if (!value)
                              {
                                ErrorDialog(
                                        message: FlutterI18n.translate(
                                            context, "error.upload.message"),
                                        title: FlutterI18n.translate(
                                            context, "error.upload.title"))
                                    .display(context)
                              }
                          }),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: CachedNetworkImage(
                          height: 150,
                          width: 150,
                          imageUrl: model.image,
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 60),
                  child: Text(
                    model.name,
                    style: TextStyle(
                        fontSize: currentFontSize.toDouble(),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: InkWell(
                        onTap: () {},
                        onHover: (value) {},
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => currentScheme.toggleTheme(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: currentScheme.getScheme().primary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 30, left: 30),
                                    child: Icon(size: 50, Icons.color_lens),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        FlutterI18n.translate(
                                            context, "account.changetheme"),
                                        style: TextStyle(
                                            fontSize:
                                                currentFontSize.toDouble(),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: currentScheme.getScheme().primary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15, left: 30),
                              child: Icon(size: 50, Icons.abc),
                            ),
                            Flexible(
                              child: Slider(
                                  max: 30,
                                  min: 18,
                                  value: model.fontSize.toDouble(),
                                  onChanged: (newFontSize) {
                                    controller.setFontSize(newFontSize.toInt());
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: InkWell(
                        onTap: () {},
                        onHover: (value) {},
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  title: Text(
                                    FlutterI18n.translate(
                                        context, "account.chooselanguage"),
                                  ),
                                  content: ButtonList(
                                      buttonMap: localeS.getAvailablelocales()),
                                  contentPadding: EdgeInsets.zero)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: currentScheme.getScheme().primary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 30, left: 30),
                                    child: Icon(size: 50, Icons.language),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        FlutterI18n.translate(
                                            context, "account.language"),
                                        style: TextStyle(
                                            fontSize:
                                                currentFontSize.toDouble(),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: InkWell(
                        onTap: () {},
                        onHover: (value) {},
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            controller.navigateGroup(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: currentScheme.getScheme().primary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 30, left: 30),
                                    child: Icon(size: 50, Icons.group),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        FlutterI18n.translate(
                                            context, "account.editGroup"),
                                        style: TextStyle(
                                            fontSize:
                                                currentFontSize.toDouble(),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: InkWell(
                      onTap: () {},
                      onHover: (value) {},
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => controller.logout(context),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: currentScheme.getScheme().primary),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: Icon(size: 50, Icons.logout),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      FlutterI18n.translate(
                                          context, "account.logout"),
                                      style: TextStyle(
                                          fontSize: currentFontSize.toDouble(),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

abstract class AccountController extends StateNotifier<AccountModel> {
  AccountController(super.state);
  void init();
  Future<void> getUsername();
  Future<void> getUserImage();
  Future<bool> changeImage();
  void logout(BuildContext context);
  void setFontSize(int fontSize);
  void navigateHome(BuildContext context);
  void navigateGroup(BuildContext context);
}

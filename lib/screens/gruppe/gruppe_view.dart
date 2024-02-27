import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/screens/gruppe/gruppe_model.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../config.dart';

class GruppeView extends ConsumerWidget {
  const GruppeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GruppeController controller =
        ref.read(providers.gruppeControllerProvider.notifier);
    final GruppeModel model = ref.watch(providers.gruppeControllerProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getGroupMembers();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          FlutterI18n.translate(context, "group.title"),
          style: TextStyle(
              fontSize: currentFontSize.toDouble() + 5,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            controller.setSetup();
            controller.navigateAccount(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          for (Member member in model.members)
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10000),
                      child: CachedNetworkImage(
                        imageUrl: member.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(
                    member.name,
                    style: TextStyle(
                        fontSize: currentFontSize.toDouble(),
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: Text(
                          (member.ammount == 1)
                              ? "${member.ammount}   ${FlutterI18n.translate(context, "group.recipe")}"
                              : "${member.ammount}   ${FlutterI18n.translate(
                                      context, "group.recipes")}",
                          style: TextStyle(
                              fontSize: currentFontSize.toDouble() - 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () =>
                              {controller.removeMember(member.id, context)},
                          icon: const Icon(Icons.remove)),
                    ],
                  )),
            ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () => controller.copyMyId(context),
                      icon: const Icon(Icons.share)),
                ),
                IconButton(
                    onPressed: () => controller.pasteIdQuickly(
                        ScaffoldMessenger.of(context),
                        FlutterI18n.translate(
                            context, "account.noAccountFound")),
                    icon: const Icon(Icons.group_add))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

abstract class GruppeController extends StateNotifier<GruppeModel> {
  GruppeController(super.state);
  void getGroupMembers();
  void setSetup();
  void newMember(BuildContext context);
  void copyMyId(BuildContext context);
  void pasteIdQuickly(
      ScaffoldMessengerState scaffoldMessengerState, String failureText);
  void removeMember(String id, BuildContext context);
  void navigateAccount(BuildContext context);
}

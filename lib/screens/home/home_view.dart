import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import '../../ui-kit/expandable_recipe_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);
    TextEditingController? searchController;
    final focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!model.hasFetchedOnInit) {
        controller.getRecipes(FirebaseAuth.instance.currentUser!.uid);
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 30, 0),
              child: SearchBar(
                leading: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                hintText: FlutterI18n.translate(context, "home.search"),
                constraints: BoxConstraints(
                    maxWidth: (MediaQuery.of(context).size.width) - 140),
                controller: searchController,
                onChanged: (text) {
                  controller.search(text);
                },
              ),
            ),
            IconButton(
              iconSize: 45,
              onPressed: () async {
                controller.filter(context);
              },
              icon: const Icon(Icons.filter_alt),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(selectedIndex: 1, destinations: [
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.star),
          onPressed: () async {
            controller.navigateFavorites(context);
          },
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () async {
            controller.navigateAccount(context);
          },
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.add),
          onPressed: () async {
            controller.navigateCreate(context);
            controller.getRecipes(FirebaseAuth.instance.currentUser!.uid);
          },
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: () =>
            controller.reload(FirebaseAuth.instance.currentUser!.uid),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              if (model.recipes.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                      child: Text(FlutterI18n.translate(context, "home.none"))),
                ),
              for (Recipe rec in model.recipes)
                ExpandableRecipeCard(
                  navigationService: controller.getNavigationservice(),
                  recipe: rec,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(super.state);
  void getRecipes(String uid);
  void search(String term);
  void filter(BuildContext context);
  Future<void> reload(String uid);
  void navigateAccount(BuildContext context);
  void navigateFavorites(BuildContext context);
  void navigateCreate(BuildContext context);
  void navigateDetail(BuildContext context, Recipe recipe);
  MyAppNavigationService getNavigationservice();
}

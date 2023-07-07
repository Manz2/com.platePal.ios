import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/screens/favoriten/favorite_model.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/ui-kit/expandable_recipe_card_favorite.dart';
import '../../config.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FavoriteController controller =
        ref.read(providers.favoriteControllerProvider.notifier);
    final FavoriteModel model = ref.watch(providers.favoriteControllerProvider);
    TextEditingController? _searchController;
    final _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!model.hasFetchedOnInit) {
        controller.getFavorites();
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
                controller: _searchController,
                focusNode: _focusNode,
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
          color: currentScheme.getScheme().primary,
          onPressed: () async {
            controller.navigateHome(context);
          },
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.home),
          onPressed: () async {
            controller.navigateHome(context);
          },
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.add),
          onPressed: () {
            controller.navigateCreate(context);
          },
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: controller.getFavorites,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              if (model.favoriten.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                      child: Text(
                          FlutterI18n.translate(context, "favorites.none"))),
                ),
              for (Recipe rec in model.favoriten)
                ExpandableRecipeCardFavorite(
                  controller: controller,
                  id: rec.id,
                  description: rec.description,
                  image: rec.image,
                  title: rec.title,
                ),
            ],
          ),
        ),
      ),
      /* ), */
    );
  }
}

abstract class FavoriteController extends StateNotifier<FavoriteModel> {
  FavoriteController(FavoriteModel state) : super(state);
  Future<void> getFavorites();
  void search(String term);
  void filter(BuildContext context);
  void navigateHome(BuildContext context);
  void navigateCreate(BuildContext context);
  void navigateDetail(BuildContext context, String recipeId);
}

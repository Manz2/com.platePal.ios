import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/config.dart';
import '../erstellen/erstellen_model.dart';
import '../home/home_model.dart';
import 'details_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsView extends ConsumerWidget {
  final Recipe recipe;
  const DetailsView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    bool isWide = width > 600;
    double sidePadding = isWide ? width / 6 : 15;
    final DetailsController controller =
        ref.read(providers.detailsViewControllerProvider.notifier);
    final DetailsModel model =
        ref.watch(providers.detailsViewControllerProvider);
    List<Ingredient> ingredients =
        controller.getIngredients(recipe.ingredients);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              controller.navigateBack(context);
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
          title: Text(
            recipe.title,
            style: TextStyle(fontSize: currentFontSize.toDouble()),
          ),
          actions: <Widget>[
            GestureDetector(
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      FlutterI18n.translate(context, "details.menu"),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            controller.navigateCreate(
                              context,
                              controller.recipeToErstellenModel(recipe),
                            );
                          },
                          child: Text(
                            FlutterI18n.translate(context, "details.edit"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              controller.deleteRecipe(context, recipe);
                            },
                            child: Text(
                              FlutterI18n.translate(
                                  context, "details.ok_detete"),
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            if (recipe.image != "")
              Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 4, sidePadding, 4),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: InteractiveViewer(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: CachedNetworkImage(
                                    imageUrl: recipe.image,
                                  ),
                                ),
                              ),
                            )),
                    child: CachedNetworkImage(
                      imageUrl: recipe.image,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            else
              const Text(""),
            for (Ingredient i in ingredients)
              Card(
                margin: EdgeInsets.fromLTRB(sidePadding, 4, sidePadding, 4),
                child: ListTile(
                  selected: (model.checked.contains(ingredients.indexOf(i))),
                  onTap: () => controller.check(ingredients.indexOf(i)),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      i.name,
                      style: TextStyle(
                          fontSize: currentFontSize.toDouble(),
                          decoration:
                              (model.checked.contains(ingredients.indexOf(i)))
                                  ? TextDecoration.lineThrough
                                  : null),
                    ),
                  ),
                  trailing: (i.amount.length < 10)
                      ? Text(
                          i.amount,
                          style: TextStyle(
                              fontSize: currentFontSize.toDouble() / 1.5,
                              decoration: (model.checked
                                      .contains(ingredients.indexOf(i)))
                                  ? TextDecoration.lineThrough
                                  : null),
                        )
                      : null,
                  subtitle: (i.amount.length >= 10)
                      ? Text(
                          i.amount,
                          style: TextStyle(
                              fontSize: currentFontSize.toDouble() / 1.5,
                              decoration: (model.checked
                                      .contains(ingredients.indexOf(i)))
                                  ? TextDecoration.lineThrough
                                  : null),
                        )
                      : null,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child:
                  Text(FlutterI18n.translate(context, "details.instructions")),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(sidePadding, 4, sidePadding, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  recipe.guideText.length,
                  (index) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '${index + 1}.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: currentFontSize.toDouble() - 3,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            recipe.guideText[index],
                            style: TextStyle(
                              fontSize: currentFontSize.toDouble(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (recipe.webURL != null)
              Card(
                margin: EdgeInsets.fromLTRB(sidePadding, 4, sidePadding, 4),
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(
                      "  ${recipe.webURL!.substring(recipe.webURL!.indexOf("://") + 3)}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontSize: currentFontSize.toDouble())),
                  onTap: () => launchUrlString(recipe.webURL!,
                      mode: LaunchMode.inAppWebView),
                ),
              ),
          ]),
        ));
  }
}

abstract class DetailsController extends StateNotifier<DetailsModel> {
  DetailsController(super.state);
  void navigateCreate(BuildContext context, ErstellenModel model);
  void navigateBack(BuildContext context);
  void check(int index);
  void deleteRecipe(BuildContext context, Recipe recipe);
  List<Ingredient> getIngredients(List<dynamic> list);
  ErstellenModel recipeToErstellenModel(Recipe recipe);
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/details/details_constants.dart';
import 'package:plate_pal/ui-kit/details_generic_card.dart';
import 'package:plate_pal/ui-kit/recipe_step_body.dart';
import '../../ui-kit/ingredient_list_elem.dart';
import '../erstellen/erstellen_model.dart';
import '../home/home_model.dart';
import 'details_model.dart';

bool initController = false;
late final DetailsController controller;

class DetailsView extends ConsumerWidget {
  final String recipeId;
  const DetailsView({Key? key, required this.recipeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!initController) {
      controller = ref.read(providers.detailsViewControllerProvider.notifier);
      initController = true;
    }
    DetailsModel model = ref.watch(providers.detailsViewControllerProvider);
    if (initController && model.recipe.id != recipeId) {
      controller.fetchRecipeDetails(recipeId);
    }
    loadColors();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              controller.navigateBack(context);
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
          title: LineText(
              model.recipe.title,
              TextStyle(
                  fontSize: currentFontSize.toDouble() + 2,
                  color: ObjectVariantColor),
              isEditable: model.isInEditMode,
              onSubmit: (x, newName) => controller.renameRecipe(newName)),
          actions: <Widget>[
            if (!model.isInEditMode) ...[
              IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: controller.removePersonAmount),
              Text(model.amountScale.toString().replaceAll(RegExp(r'\.0$'), ''),
                  style: TextStyle(
                      fontSize: currentFontSize.toDouble() - 3,
                      fontWeight: FontWeight.bold,
                      color: ObjectPrimaryColor)),
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: controller.addPersonAmount)
            ],
            GestureDetector(
              onLongPress: () async {
                controller.toggleEditMode(context);
              },
              child: IconButton(
                icon: model.isInEditMode
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.edit_outlined),
                onPressed: () async {
                  !model.isInEditMode
                      ? controller.navigateCreate(context,
                          controller.recipeToErstellenModel(model.recipe))
                      : controller.toggleEditMode(context);
                },
              ),
            ),
            IconButton(
              icon: (model.isFavorite
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border_outlined)),
              onPressed: () async {
                controller.toggleFavorite();
              },
            ),
          ]),
      body: const Center(child: RecipeBody()),
      backgroundColor: BackgroundColor,
    );
  }
}

class RecipeBody extends ConsumerWidget {
  const RecipeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DetailsModel model = ref.watch(providers.detailsViewControllerProvider);
    int myIngredientID = 1;

    List<Widget> _ingredientListElements = [
      for (Ingredient i
          in (model.isInEditMode) ? model.ingredients : model.scaledIngredients)
        IngredientListElem(
            key: Key('$myIngredientID'),
            ingredientNumber: myIngredientID++,
            ingredientName: i.name,
            ingredientAmount: i.amount,
            isInEditMode: model.isInEditMode,
            isHighlighting: i.name == model.currentlySearchedIngredient?.name,
            controller: controller),
    ];

    return RefreshIndicator(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: <Widget>[
                  if (!model.isInEditMode)
                    ..._ingredientListElements
                  else
                    ReorderableListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      onReorder: (oldIndex, newIndex) {
                        controller.moveIngredient(oldIndex, newIndex);
                      },
                      onReorderStart: (index) => HapticFeedback.lightImpact(),
                      children: [
                        ..._ingredientListElements,
                      ],
                    ),
                  if (model.guideTextWidgets.isNotEmpty)
                    GenericCard(
                      icon: symPadding(
                          Icon(Icons.info_outline,
                              color: ObjectSecondaryColor, size: menuObjSize),
                          horizontal: 10,
                          vertical: 10),
                      title: "  " +
                          FlutterI18n.translate(
                              context,
                              (model.guideTextWidgets.length == 1)
                                  ? "details.notes"
                                  : "details.instructions"),
                      titleStyle: TextStyle(color: ObjectSecondaryColor),
                      extendedContent: Padding(
                          child: Column(
                            children: buildGuideStepTextWidgets(
                                model.guideTextWidgets,
                                controller.buildHighlightList()),
                          ),
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 4)),
                    ),
                  if (model.recipe.id != emptyRecipe().id)
                    GenericCard(
                        icon: symPadding(
                            Transform.rotate(
                              angle: 180 * math.pi / 145,
                              child: Icon(Icons.attach_file,
                                  color: ObjectSecondaryColor,
                                  size: menuObjSize),
                            ),
                            horizontal: 10,
                            vertical: 10),
                        title: "  " +
                            ((model.recipe.attachments!.isEmpty)
                                ? FlutterI18n.translate(
                                    context, "details.add_file")
                                : FlutterI18n.translate(
                                    context, "details.attachments")),
                        titleStyle: TextStyle(color: ObjectSecondaryColor),
                        addBottomPadding: model.recipe.attachments?.isNotEmpty,
                        extendedContent: listAllAttachmentLinks(
                            context, model.recipe.attachments ?? []),
                        onPressed: () async {
                          controller.addAttachment(context);
                        }),
                  if (model.recipe.webURL != null)
                    GenericCard(
                      icon: symPadding(
                          Icon(Icons.link,
                              color: ObjectSecondaryColor, size: menuObjSize),
                          horizontal: 10,
                          vertical: 10),
                      title: "  " +
                          model.recipe.webURL!.substring(
                              model.recipe.webURL!.indexOf("://") + 3),
                      titleStyle: urlStyle,
                      onPressed: () => launchUrlString(model.recipe.webURL!,
                          mode: LaunchMode.inAppWebView),
                    ),
                ])),
          ),
        ],
      ),
      onRefresh: () => controller.fetchRecipeDetails(model.recipe.id),
    );
  }

  List<Widget> buildGuideStepTextWidgets(
      List<List<TextSpan>> stepTexts, List<bool> searchedIngredientFoundIn) {
    List<Widget> widgets = [];
    int currentStep = 1;

    for (List<TextSpan> wordsAsTextSpans in stepTexts) {
      widgets.add(RecipeStepBody(
          highlighted: searchedIngredientFoundIn[currentStep - 1],
          richTextSpans: wordsAsTextSpans,
          stepText: currentStep.toString() + "."));
      currentStep++;
    }

    return widgets;
  }

  Widget listAllAttachmentLinks(context, List<String> links) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(children: [
          for (String link in links)
            GestureDetector(
                child: Row(children: [
                  Text("  ●   ", style: TextStyle(color: ObjectSecondaryColor)),
                  Flexible(
                    child: Text(
                        link.substring(0, 1).toUpperCase() + link.substring(1),
                        style: urlStyle,
                        overflow: TextOverflow.ellipsis),
                  )
                ]),
                onTap: () => controller.openAttachment(link),
                onLongPress: () =>
                    controller.removeFromAttachments(link, context)),
        ]));
  }
}

abstract class DetailsController extends StateNotifier<DetailsModel> {
  DetailsController(DetailsModel state) : super(state);
  Future<void> fetchRecipeDetails(String id);
  void toggleFavorite();
  void openAttachment(String fileName);
  void addAttachment(BuildContext context);
  void removeFromAttachments(String fileName, context);
  void toggleIngredientHighlightingFocus(String ingredientName);
  List<bool> buildHighlightList();
  void toggleEditMode(context);
  void renameRecipe(String newName);
  void ingredientNameChanged(String ingredientName, String newName);
  void ingredientAmountChanged(String ingredientName, String newAmount);
  void moveIngredient(int oldIndex, int newIndex);
  void addPersonAmount();
  void removePersonAmount();
  void navigateCreate(BuildContext context, ErstellenModel model);
  void navigateBack(BuildContext context);
  ErstellenModel recipeToErstellenModel(Recipe recipe);
}

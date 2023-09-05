import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/common/providers.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/ui-kit/add_text_field_widget.dart';
import 'package:plate_pal/ui-kit/add_text_field_widget_steps.dart';

class ErstellenView extends ConsumerWidget {
  final ErstellenModel? recipe;

  ErstellenView({Key? key, this.recipe}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ErstellenModel model;
    final ErstellenController controller;
    if (recipe != null) {
      controller =
          ref.read(providers.editErstellenControllerProvider(recipe!).notifier);
      model = ref.watch(providers.editErstellenControllerProvider(recipe!));
    } else {
      controller = ref.read(providers.erstellenControllerProvider.notifier);
      model = ref.watch(providers.erstellenControllerProvider);
    }
    if (_nameController.text != model.name) {
      _nameController.text = model.name;
    }
    if (_descriptionController.text != model.description) {
      _descriptionController.text = model.description;
    }
    if (_linkController.text != model.webURL) {
      _linkController.text = model.webURL ?? "";
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (await controller.deleteAll(context)) {
              controller.navigateBack(context);
            }
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: Text(
          FlutterI18n.translate(context,
              (model.isEdit) ? "create.editRecipe" : "create.newRecipe"),
          style: TextStyle(
              fontSize: currentFontSize.toDouble() + 5,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              model.image != ""
                  ? GestureDetector(
                      onTap: () => controller.addImage(context, model.image),
                      child: CachedNetworkImage(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width - 100,
                        imageUrl: model.image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : IconButton(
                      onPressed: () =>
                          controller.addImage(context, model.image),
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                        size: MediaQuery.of(context).size.height / 5,
                      )),
              const SizedBox(height: 16.0),
              TextField(
                style: TextStyle(fontSize: currentFontSize.toDouble()),
                decoration: InputDecoration(
                    labelText: FlutterI18n.translate(context, "create.name"),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    labelStyle: TextStyle(
                        fontSize: currentFontSize.toDouble(),
                        color: model.nameNotSet
                            ? currentScheme.getScheme().error
                            : currentScheme.getScheme().onSurfaceVariant)),
                textInputAction: TextInputAction.next,
                controller: _nameController,
                onChanged: (_) => {
                  controller.setTitle(_),
                },
              ),
              const SizedBox(height: 16.0),
              AddTextFieldWidget(
                con: controller,
                ingredients: model.requiredIngredients,
              ),
              const SizedBox(height: 16.0),
              AddTextFieldWidgetSteps(con: controller, steps: model.steps),
              const SizedBox(height: 16.0),
              TextField(
                style: TextStyle(fontSize: currentFontSize.toDouble()),
                decoration: InputDecoration(
                    labelText:
                        FlutterI18n.translate(context, "create.description"),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    labelStyle: TextStyle(
                        fontSize: currentFontSize.toDouble(),
                        color: model.descriptionNotSet
                            ? currentScheme.getScheme().error
                            : currentScheme.getScheme().onSurfaceVariant)),
                controller: _descriptionController,
                onChanged: (_) => {
                  controller.setDescription(_),
                },
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16.0),
              TextField(
                style: TextStyle(fontSize: currentFontSize.toDouble()),
                decoration: InputDecoration(
                  labelText: 'WebUrl (optional)',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  labelStyle: TextStyle(
                    fontSize: currentFontSize.toDouble(),
                    color: model.urlInvalid
                        ? currentScheme.getScheme().error
                        : currentScheme.getScheme().onSurfaceVariant,
                  ),
                ),
                controller: _linkController,
                onChanged: (_) {
                  controller.setlink(_);
                },
              ),
              const SizedBox(height: 16.0),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () => controller.setVegan(!model.vegan),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: model.vegan,
                          onChanged: (value) => controller.setVegan(value),
                        ),
                        Text(
                          FlutterI18n.translate(context, "create.vegan"),
                          style:
                              TextStyle(fontSize: currentFontSize.toDouble()),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.setVegetarisch(!model.vegetarisch),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: model.vegetarisch,
                          onChanged: (value) =>
                              controller.setVegetarisch(value),
                        ),
                        Text(
                            FlutterI18n.translate(context, "create.vegetarian"),
                            style: TextStyle(
                                fontSize: currentFontSize.toDouble())),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.setGlutenfrei(!model.glutenfrei),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: model.glutenfrei,
                          onChanged: (value) => controller.setGlutenfrei(value),
                        ),
                        Text(FlutterI18n.translate(context, "create.gluten"),
                            style: TextStyle(
                                fontSize: currentFontSize.toDouble())),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!kIsWeb && !model.isEdit)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (await controller.kiImport(context)) {
                            final snackBar = SnackBar(
                              content: Text(FlutterI18n.translate(
                                  context, "create.ai.success")),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar = SnackBar(
                              content: Text(FlutterI18n.translate(
                                  context, "create.ai.failure")),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text(
                            FlutterI18n.translate(context, "create.ai.import"),
                            style: TextStyle(
                                fontSize: currentFontSize.toDouble())),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.createRecipe(context)) {
                        controller.navigateBack(context);
                      } else {
                        final snackBar = SnackBar(
                          content: Text(FlutterI18n.translate(
                              context, "create.notAllFields")),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                        FlutterI18n.translate(context,
                            model.isEdit ? "create.update" : "create.create"),
                        style: TextStyle(fontSize: currentFontSize.toDouble())),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class ErstellenController extends StateNotifier<ErstellenModel> {
  ErstellenController(ErstellenModel state) : super(state);

  bool createRecipe(BuildContext context);

  bool isValidUrl(String url);

  void setTitle(String name);

  void setDescription(String desc);

  void setGlutenfrei(bool? glut);

  void setVegan(bool? vegan);

  void setVegetarisch(bool? veggie);

  void addZutat(Ingredient zutat);

  void deleteZutat(Ingredient zutat);

  void addStep(String step);

  void deleteStep(String step);

  void insertStep(int index, String step);

  void addImage(BuildContext context, String image);

  Future<bool> kiImport(BuildContext context);

  bool getIngridientsNotSet();

  bool getStepsNotSet();

  Future<bool> deleteAll(BuildContext context);

  void helper(BuildContext context);

  void setModel(ErstellenModel? model);

  void setlink(String link);

  void navigateBack(BuildContext context);
}

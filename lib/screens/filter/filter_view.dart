import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plate_pal/common/providers.dart';
import '../../config.dart';
import 'filter_model.dart';

class FilterView extends ConsumerWidget {
  final Function(List<bool>) function;
  const FilterView({super.key, required this.function});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FilterController controller =
        ref.read(providers.filterControllerProvider.notifier);
    final FilterModel model = ref.watch(providers.filterControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.pop(context, function);
          },
          icon: const Icon(Icons.arrow_back_sharp),
          //replace with our own icon data.
        ),
        title: Text(FlutterI18n.translate(context, "filter.filter")),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "assets/images/vegan.svg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        currentScheme.getScheme().primary, BlendMode.srcIn),
                  ),
                  Text(FlutterI18n.translate(context, "filter.vegan")),
                  Switch(
                      value: model.vegan,
                      onChanged: (bo) => controller.veganChanged(bo))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "assets/images/vegetarisch.svg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        currentScheme.getScheme().primary, BlendMode.srcIn),
                  ),
                  Text(FlutterI18n.translate(context, "filter.vegetarian")),
                  Switch(
                      value: model.vegetarisch,
                      onChanged: (bo) => controller.vegetarischChanged(bo))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "assets/images/glutenfrei.svg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        currentScheme.getScheme().primary, BlendMode.srcIn),
                  ),
                  Text(FlutterI18n.translate(context, "filter.gluten")),
                  SizedBox(
                    child: Switch(
                        value: model.glutenfrei,
                        onChanged: (bo) => controller.glutenfreiChanged(bo)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class FilterController extends StateNotifier<FilterModel> {
  FilterController(super.state);
  void vegetarischChanged(bool bo);
  void veganChanged(bool bo);
  void glutenfreiChanged(bool bo);
  void pop(BuildContext context, Function(List<bool>) function);
}

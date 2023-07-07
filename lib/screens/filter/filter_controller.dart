import 'package:flutter/material.dart';
import 'package:plate_pal/screens/filter/filter_model.dart';
import 'package:plate_pal/screens/filter/filter_view.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';

bool veganFilter = false;
bool vegetarischFilter = false;
bool glutenfreiFilter = false;

class FilterControllerImplmentation extends FilterController {
  final MyAppNavigationService _navigationService;
  FilterControllerImplmentation({
    FilterModel? model,
    required MyAppNavigationService navigationService,
  })  : _navigationService = navigationService,
        super(model ??
            const FilterModel(
                glutenfrei: false, vegan: false, vegetarisch: false));

  @override
  void vegetarischChanged(bo) {
    state = state.copyWith(vegetarisch: !state.vegetarisch);
  }

  @override
  void glutenfreiChanged(bo) {
    state = state.copyWith(glutenfrei: !state.glutenfrei);
  }

  @override
  void veganChanged(bo) {
    state = state.copyWith(vegan: !state.vegan);
  }

  @override
  void pop(BuildContext context, Function(List<bool>) function) {
    function([state.vegan, state.vegetarisch, state.glutenfrei]);
    _navigationService.routeBack(context);
  }
}

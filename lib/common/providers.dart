import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plate_pal/screens/details/details_model.dart';
import 'package:plate_pal/screens/erstellen/erstellen_backend_service.dart';
import 'package:plate_pal/screens/favoriten/favoriten_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_controller.dart';
import 'package:plate_pal/screens/gruppe/gruppe_model.dart';
import 'package:plate_pal/screens/gruppe/gruppe_view.dart';
import 'package:plate_pal/screens/home/home_backend_service.dart';
import 'package:plate_pal/screens/login/login_backend_service.dart';
import 'package:plate_pal/service/backend_service_aggregator.dart';
import 'package:plate_pal/service/backend_service.dart';
import 'package:plate_pal/screens/account/account_backend_service.dart';
import 'package:plate_pal/screens/account/account_controller.dart';
import 'package:plate_pal/screens/account/account_model.dart';
import 'package:plate_pal/screens/account/account_view.dart';
import 'package:plate_pal/screens/erstellen/erstellen_controller.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';
import 'package:plate_pal/screens/favoriten/favorite_controller.dart';
import 'package:plate_pal/screens/favoriten/favorite_model.dart';
import 'package:plate_pal/screens/favoriten/favorite_view.dart';
import 'package:plate_pal/screens/home/home_controller.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/screens/home/home_view.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import '../screens/details/details_backend_service.dart';
import '../screens/details/details_controller.dart';
import '../screens/details/details_view.dart';
import 'package:plate_pal/screens/login/login_model.dart';
import 'package:plate_pal/screens/login/login_view.dart';
import 'package:plate_pal/service/navigation_service.dart';
import 'package:plate_pal/service/navigation_service_aggregator.dart';
import '../screens/filter/filter_controller.dart';
import '../screens/filter/filter_model.dart';
import '../screens/filter/filter_view.dart';
import '../screens/login/login_controller.dart';

final Providers providers = Providers();

class Providers {
  final Provider backendServiceProvider =
      Provider<BackendServiceAggregator>((_) => BackendService());
  final Provider navigationServiceProvider =
      Provider<NavigationServiceAggregator>((_) => NavigationService());
  final AutoDisposeStateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider =
      StateNotifierProvider.autoDispose<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplmentation(
                backendService: ref.read(
                  providers.backendServiceProvider
                      as ProviderListenable<HomeBackendService>,
                ),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));

  final StateNotifierProvider<FilterController, FilterModel>
      filterControllerProvider =
      StateNotifierProvider<FilterController, FilterModel>(
          (StateNotifierProviderRef ref) => FilterControllerImplmentation(
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));

  final StateNotifierProvider<LoginController, LoginModel>
      loginControllerProvider =
      StateNotifierProvider<LoginController, LoginModel>(
          (StateNotifierProviderRef ref) => LoginControllerImplmentation(
                backendService: ref.read(providers.backendServiceProvider
                    as ProviderListenable<LoginBackendService>),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));

  final StateNotifierProvider<FavoriteController, FavoriteModel>
      favoriteControllerProvider =
      StateNotifierProvider<FavoriteController, FavoriteModel>(
          (StateNotifierProviderRef ref) => FavoriteControllerImplmentation(
                backendService: ref.read(providers.backendServiceProvider
                    as ProviderListenable<FavoritenBackendService>),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));

  final StateNotifierProvider<AccountController, AccountModel>
      accountControllerProvider =
      StateNotifierProvider<AccountController, AccountModel>(
          (StateNotifierProviderRef ref) => AccountControllerImplmentation(
                backendService: ref.read(providers.backendServiceProvider
                    as ProviderListenable<AccountBackendService>),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));
  final AutoDisposeStateNotifierProvider<ErstellenController, ErstellenModel>
      erstellenControllerProvider =
      StateNotifierProvider.autoDispose<ErstellenController, ErstellenModel>(
          (StateNotifierProviderRef ref) => ErstellenControllerImplementation(
                backendService: ref.read(providers.backendServiceProvider
                    as ProviderListenable<ErstellenBackendService>),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));

  final editErstellenControllerProvider = StateNotifierProvider.autoDispose
      .family<ErstellenController, ErstellenModel, ErstellenModel>(
    (ref, edit) => ErstellenControllerImplementation(
      model: edit,
      backendService: ref.read(providers.backendServiceProvider
          as ProviderListenable<ErstellenBackendService>),
      navigationService: ref.read(providers.navigationServiceProvider
          as ProviderListenable<MyAppNavigationService>),
    ),
  );

  final AutoDisposeStateNotifierProvider<DetailsController, DetailsModel>
      detailsViewControllerProvider =
      StateNotifierProvider.autoDispose<DetailsController, DetailsModel>(
          (StateNotifierProviderRef ref) => DetailsControllerImplementation(
                backendService: ref.read(providers.backendServiceProvider
                    as ProviderListenable<DetailsBackendService>),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));

  final AutoDisposeStateNotifierProvider<GruppeController, GruppeModel>
      gruppeControllerProvider =
      StateNotifierProvider.autoDispose<GruppeController, GruppeModel>(
          (StateNotifierProviderRef ref) => GruppeControllerImplmentation(
                backendService: ref.read(providers.backendServiceProvider
                    as ProviderListenable<GruppeBackendService>),
                navigationService: ref.read(providers.navigationServiceProvider
                    as ProviderListenable<MyAppNavigationService>),
              ));
}

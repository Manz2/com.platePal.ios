import 'package:plate_pal/screens/account/account_backend_service.dart';
import 'package:plate_pal/screens/details/details_backend_service.dart';
import 'package:plate_pal/screens/erstellen/erstellen_backend_service.dart';
import 'package:plate_pal/screens/favoriten/favoriten_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_backend_service.dart';
import 'package:plate_pal/screens/home/home_backend_service.dart';
import 'package:plate_pal/screens/login/login_backend_service.dart';

abstract class BackendServiceAggregator
    implements
        AccountBackendService,
        FavoritenBackendService,
        HomeBackendService,
        LoginBackendService,
        GruppeBackendService,
        ErstellenBackendService,
        DetailsBackendService {}

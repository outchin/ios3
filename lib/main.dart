
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

// import 'package:path_provider/path_provider.dart';
import '../../service/get_config_service.dart';
import 'app.dart';
import 'data/repository/config_repository.dart';
import 'models/configuration.dart';
import 'models/user_model.dart';
import 'service/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  // final document = await getApplicationDocumentsDirectory();
  // Hive.init(document.path);
  // Hive not only supports primitives, lists and maps but also any Dart object you like. You need to generate a type adapter before you can store objects.
  Hive.registerAdapter(ConfigurationModelAdapter());
  Hive.registerAdapter(AppConfigAdapter());
  Hive.registerAdapter(AdsConfigAdapter());
  Hive.registerAdapter(PaymentConfigAdapter());
  Hive.registerAdapter(ApkVersionInfoAdapter());
  Hive.registerAdapter(GenreAdapter());
  Hive.registerAdapter(CountryAdapter());
  Hive.registerAdapter(TvCategoryAdapter());
  Hive.registerAdapter(AuthUserAdapter());
  await Hive.openBox<ConfigurationModel>('configBox');
  await Hive.openBox<AppConfig>('appConfigbox');
  await Hive.openBox<AdsConfig>('adsConfigbox');
  await Hive.openBox<PaymentConfig>('paymentConfigbox');
  await Hive.openBox<AuthUser>('oxooUser');
  await Hive.openBox('appModeBox');

  ConfigurationModel? configurationModel;
  configurationModel = await ConfigurationRepositoryImpl().getConfigurationData();
  GetConfigService().updateGetConfig(configurationModel);
  setupLocator();
  if (defaultTargetPlatform == TargetPlatform.android) {

  }
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:forcard/app/modules/auth/auth_module.dart';
import 'package:forcard/app/modules/extract/extract_module.dart';
import 'package:forcard/app/modules/recharge/recharge_module.dart';
import 'package:forcard/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/recharge', module: RechargeModule()),
        ModuleRoute('/extract', module: ExtractModule()),
      ];
}

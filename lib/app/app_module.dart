import 'package:flutter_modular/flutter_modular.dart';
import 'package:forcard/app/modules/auth/auth_module.dart';
import 'package:forcard/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:forcard/app/modules/auth/login_page.dart';
import 'package:forcard/app/modules/auth/singup_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const LoginPage()),
    ChildRoute("/singup", child: (context, args) => const SingUpPage()),
  ];
}

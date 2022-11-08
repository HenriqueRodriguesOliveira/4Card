import 'package:flutter_modular/flutter_modular.dart';
import 'package:forcard/app/modules/extract/extract_page.dart';

class ExtractModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const ExtractPage()),
  ];
}

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/home/home_controller.dart';
import 'package:mobile/app/services/sonhos_repository.dart';
// import 'package:mobile/app/modules/home/home_page.dart';

import 'pages/criar_sonho.dart';
import 'pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => HomeController()),
        Bind((i) => HomeController(i.get<SonhosRepository>())),
        Bind((i) => SonhosRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/CriarSonho', child: (_, args) => CriarSonho()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

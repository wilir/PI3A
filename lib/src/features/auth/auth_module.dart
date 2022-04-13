import 'package:basearch/src/features/auth/presentation/view/page/forgotpass_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import '../onboarding/presentation/view/page/splash_screen.dart';
import 'data/repository/login_repository.dart';
import 'domain/repository/login_interface.dart';
import 'domain/usecase/login_usecase.dart';
import 'presentation/view/page/login_page.dart';
import 'presentation/view/page/signup_page.dart';
import 'presentation/viewmodel/login_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory<ILogin>((i) => LoginRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SplashScreen()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
        ChildRoute('/signup', child: (_, __) => const SignUpPage()),
        ChildRoute('/forgotpass', child: (_, __) => const ForgotPassPage()),
        ModuleRoute('/home', module: HomeModule())
      ];
}

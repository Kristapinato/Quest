import 'package:practice_1/meta/views/authentication/login.view.dart';
import 'package:practice_1/meta/views/authentication/signup.view.dart';

class Approutes {
  static const String LoginRoute = "/login";
  static const String SignUpRoute = "/signup";

  static final routes = {
    LoginRoute: (context) => LoginView(),
    SignUpRoute: (context) => Signup()
  };
}

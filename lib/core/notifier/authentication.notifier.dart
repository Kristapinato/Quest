import 'package:flutter/cupertino.dart';
import 'package:practice_1/core/service/authentication.service.dart';
import 'package:practice_1/meta/views/authentication/login.view.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      new AuthenticationService();

  Future<String?> signup({
    required String Email,
    required String Password,
  }) async {
    try {
      await _authenticationService.signup(Email: Email, Password: Password);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> LoginView({
    required String Email,
    required String Password,
  }) async {
    try {
      await _authenticationService.LoginView(Email: Email, Password: Password);
    } catch (e) {
      print(e);
    }
  }
}

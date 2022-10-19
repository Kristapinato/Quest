import 'package:practice_1/app/providers/credentials/supabase.credentials.dart';
import 'package:practice_1/meta/views/authentication/login.view.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<String?> signup({
    required String Email,
    required String Password,
  }) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signUp(Email, Password);

    if (response.error == null) {
      String? userEmail = response.data!.user!.email;
      print("Signup successfull: $userEmail");
    } else {
      print("SignUp Error : ${response.error!.message}");
    }
  }

  Future<String?> LoginView({
    required String Email,
    required String Password,
  }) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signIn(
            email: Email,
            password: Password,
            options: AuthOptions(redirectTo: SupabaseCredentials.APIURL));

    if (response.error == null) {
      print('Login Successful');
      String? userEmail = response.data!.user!.email;
    } else {
      print("Login Error : ${response.error!.message}");
    }
  }
}

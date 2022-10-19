import 'package:practice_1/app/providers/credentials/supabase.credentials.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<void> signup({
    required String Email,
    required String Password,
  }) async {
    GotrueResponse response =
        await SupabaseCredentials.supabaseClient.auth.signUp(Email, Password);

    if (response.error == null) {
      print('SignUp Successful');
      String? userEmail = response.data.user.email;
    }
  }
}

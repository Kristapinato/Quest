import 'package:supabase/supabase.dart';

class SupabaseCredentials {
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZnb3BlcXZxZm1seXl3aHFtcGV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjU3NjYyMjgsImV4cCI6MTk4MTM0MjIyOH0.5qX14gvqDT9VmU42V5sbol3Yc41WbOZfQ9iMwkeVPOI";
  static const String APIURL = "https://vgopeqvqfmlyywhqmpet.supabase.co";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
